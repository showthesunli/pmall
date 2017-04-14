<#macro error field>
    <#if errorMsg??>
        <#assign fieldPath="errorMsg."+field>
        ${fieldPath?eval}
    </#if>
</#macro>
