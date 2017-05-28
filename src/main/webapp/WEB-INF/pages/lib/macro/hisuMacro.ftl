<#macro error field>
    <#if errorMsg??>
        <#assign fieldPath="errorMsg."+field>
        ${fieldPath?eval}
    </#if>
</#macro>

<#--分页宏-->
<#macro pageset currentPage totalRecNum numOfPerPage uri>
    <#assign numofpage=(totalRecNum/numOfPerPage)?ceiling>
    <#assign perPage=currentPage-1>
    <#assign nextpage=currentPage+1>
    <div class="page">
        <a class="a1">共${numofpage}页</a>
        <#if currentPage!=1>
            <a href="<@spring.url '/${uri};currentPage=${perPage};'/>" class="a1">上一页</a>
        </#if>

        <#if numofpage<=5>
            <#list 1..numofpage as x>
                <#if currentPage==x >
                    <span>${currentPage}</span>
                <#else>
                    <a href="<@spring.url '/${uri};currentPage=${x}'/>">${x}</a>
                </#if>
            </#list>
        <#else>
            <#if (currentPage > 2)>
            ...
            <a href="<@spring.url '/${uri};currentPage=${currentPage-2}'/>">${currentPage-2}</a>
            <a href="<@spring.url '/${uri};currentPage=${currentPage-1}'/>">${currentPage-1}</a>
            </#if>
            <span>${currentPage}</span>
            <#if currentPage < numofpage-2>
                <a href="<@spring.url '/${uri};currentPage=${currentPage+1}'/>">${currentPage+1}</a>
                <a href="<@spring.url '/${uri};currentPage=${currentPage+2}'/>">${currentPage+2}</a>
                ...
            </#if>
        </#if>
        <#if currentPage<numofpage>
            <a href="<@spring.url '/${uri};currentPage=${nextpage};'/>" class="a1">下一页</a>
        </#if>
    </div>
</#macro>