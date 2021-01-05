Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A32B72EB2C9
	for <lists+dm-devel@lfdr.de>; Tue,  5 Jan 2021 19:49:45 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-DF72OlFzNrel2qQCP9E4YA-1; Tue, 05 Jan 2021 13:49:41 -0500
X-MC-Unique: DF72OlFzNrel2qQCP9E4YA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F93215720;
	Tue,  5 Jan 2021 18:49:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CD481002388;
	Tue,  5 Jan 2021 18:49:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 451A94BB7B;
	Tue,  5 Jan 2021 18:49:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 105In5YN009719 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 5 Jan 2021 13:49:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 958582166B2A; Tue,  5 Jan 2021 18:49:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FF852166B29
	for <dm-devel@redhat.com>; Tue,  5 Jan 2021 18:49:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE7BE811E98
	for <dm-devel@redhat.com>; Tue,  5 Jan 2021 18:49:02 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-470--56XWt4yNVWo8R6T44jLFQ-1;
	Tue, 05 Jan 2021 13:49:00 -0500
X-MC-Unique: -56XWt4yNVWo8R6T44jLFQ-1
Received: from [192.168.86.31] (c-71-197-163-6.hsd1.wa.comcast.net
	[71.197.163.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id 02E0720B7192;
	Tue,  5 Jan 2021 10:48:57 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 02E0720B7192
To: Mimi Zohar <zohar@linux.ibm.com>, stephen.smalley.work@gmail.com,
	casey@schaufler-ca.com, agk@redhat.com, snitzer@redhat.com,
	gmazyland@gmail.com, paul@paul-moore.com
References: <20201212180251.9943-1-tusharsu@linux.microsoft.com>
	<20201212180251.9943-2-tusharsu@linux.microsoft.com>
	<acec2f96b5fa5ae8fb0e12e76f508cf6e7f7ec97.camel@linux.ibm.com>
From: Tushar Sugandhi <tusharsu@linux.microsoft.com>
Message-ID: <1f5354ba-e68d-6e3c-9b7e-3ac7b522182e@linux.microsoft.com>
Date: Tue, 5 Jan 2021 10:48:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <acec2f96b5fa5ae8fb0e12e76f508cf6e7f7ec97.camel@linux.ibm.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: sashal@kernel.org, dm-devel@redhat.com, selinux@vger.kernel.org,
	jmorris@namei.org, linux-kernel@vger.kernel.org,
	nramas@linux.microsoft.com, linux-security-module@vger.kernel.org,
	tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v9 1/8] IMA: generalize keyring specific
 measurement constructs
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Hello Mimi,
Sorry for the late response. I was on vacation last week.

On 2020-12-24 5:06 a.m., Mimi Zohar wrote:
> On Sat, 2020-12-12 at 10:02 -0800, Tushar Sugandhi wrote:
>>
>> diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
>> index 68956e884403..e76ef4bfd0f4 100644
>> --- a/security/integrity/ima/ima_main.c
>> +++ b/security/integrity/ima/ima_main.c
>> @@ -786,13 +786,13 @@ int ima_post_load_data(char *buf, loff_t size,
>>    * @eventname: event name to be used for the buffer entry.
>>    * @func: IMA hook
>>    * @pcr: pcr to extend the measurement
>> - * @keyring: keyring name to determine the action to be performed
>> + * @func_data: private data specific to @func, can be NULL.
> 
> This can be simplified to "func specific data, may be NULL".   Please
> update in all places.
> 
Ok, will do.
>>    *
>>    * Based on policy, the buffer is measured into the ima log.
>>    */
>>   void process_buffer_measurement(struct inode *inode, const void *buf, int size,
>>   				const char *eventname, enum ima_hooks func,
>> -				int pcr, const char *keyring)
>> +				int pcr, const char *func_data)
>>   {
>>   	int ret = 0;
>>   	const char *audit_cause = "ENOMEM";
>> @@ -831,7 +831,7 @@ void process_buffer_measurement(struct inode *inode, const void *buf, int size,
>>   	if (func) {
>>   		security_task_getsecid(current, &secid);
>>   		action = ima_get_action(inode, current_cred(), secid, 0, func,
>> -					&pcr, &template, keyring);
>> +					&pcr, &template, func_data);
>>   		if (!(action & IMA_MEASURE))
>>   			return;
>>   	}
>> diff --git a/security/integrity/ima/ima_policy.c b/security/integrity/ima/ima_policy.c
>> index 823a0c1379cb..a09d1a41a290 100644
>> --- a/security/integrity/ima/ima_policy.c
>> +++ b/security/integrity/ima/ima_policy.c
>> @@ -453,30 +453,41 @@ int ima_lsm_policy_change(struct notifier_block *nb, unsigned long event,
>>   }
>>   
>>   /**
>> - * ima_match_keyring - determine whether the keyring matches the measure rule
>> - * @rule: a pointer to a rule
>> - * @keyring: name of the keyring to match against the measure rule
>> + * ima_match_rule_data - determine whether the given func_data matches
>> + *			 the measure rule data
> 
> After the function_name is a brief description of the function, which
> should not span multiple lines.  Refer to Documentation/doc-
> guide/kernel-doc.rst for details.
> 
> Please trim the function description to:
> determine whether func_data matches the policy rule
> 
Thanks, will do.

>> + * @rule: IMA policy rule
> 
> This patch should be limited to renaming "keyring" to "func_data".   It
> shouldn't make other changes, even simple ones like this.
> 
Agreed. I will revert the rule description to the old one.
>> + * @func_data: data to match against the measure rule data
>>    * @cred: a pointer to a credentials structure for user validation
>>    *
>> - * Returns true if keyring matches one in the rule, false otherwise.
>> + * Returns true if func_data matches one in the rule, false otherwise.
>>    */
>> -static bool ima_match_keyring(struct ima_rule_entry *rule,
>> -			      const char *keyring, const struct cred *cred)
>> +static bool ima_match_rule_data(struct ima_rule_entry *rule,
>> +				const char *func_data,
>> +				const struct cred *cred)
>>   {
>> +	const struct ima_rule_opt_list *opt_list = NULL;
>>   	bool matched = false;
>>   	size_t i;
>>   
>>   	if ((rule->flags & IMA_UID) && !rule->uid_op(cred->uid, rule->uid))
>>   		return false;
>>   
>> -	if (!rule->keyrings)
>> -		return true;
>> +	switch (rule->func) {
>> +	case KEY_CHECK:
>> +		if (!rule->keyrings)
>> +			return true;
>> +
>> +		opt_list = rule->keyrings;
>> +		break;
>> +	default:
>> +		return false;
>> +	}
>>   
>> -	if (!keyring)
>> +	if (!func_data)
>>   		return false;
>>   
>> -	for (i = 0; i < rule->keyrings->count; i++) {
>> -		if (!strcmp(rule->keyrings->items[i], keyring)) {
>> +	for (i = 0; i < opt_list->count; i++) {
>> +		if (!strcmp(opt_list->items[i], func_data)) {
>>   			matched = true;
>>   			break;
>>   		}
>> @@ -493,20 +504,20 @@ static bool ima_match_keyring(struct ima_rule_entry *rule,
>>    * @secid: the secid of the task to be validated
>>    * @func: LIM hook identifier
>>    * @mask: requested action (MAY_READ | MAY_WRITE | MAY_APPEND | MAY_EXEC)
>> - * @keyring: keyring name to check in policy for KEY_CHECK func
>> + * @func_data: private data specific to @func, can be NULL.
> 
> Update as previously suggested.
> 
Yes.
>>    *
>>    * Returns true on rule match, false on failure.
>>    */
>>   static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
>>   			    const struct cred *cred, u32 secid,
>>   			    enum ima_hooks func, int mask,
>> -			    const char *keyring)
>> +			    const char *func_data)
>>   {
>>   	int i;
>>   
>>   	if (func == KEY_CHECK) {
>>   		return (rule->flags & IMA_FUNC) && (rule->func == func) &&
>> -		       ima_match_keyring(rule, keyring, cred);
>> +			ima_match_rule_data(rule, func_data, cred);
>>   	}
>>   	if ((rule->flags & IMA_FUNC) &&
>>   	    (rule->func != func && func != POST_SETATTR))
>> @@ -610,8 +621,7 @@ static int get_subaction(struct ima_rule_entry *rule, enum ima_hooks func)
>>    * @mask: requested action (MAY_READ | MAY_WRITE | MAY_APPEND | MAY_EXEC)
>>    * @pcr: set the pcr to extend
>>    * @template_desc: the template that should be used for this rule
>> - * @keyring: the keyring name, if given, to be used to check in the policy.
>> - *           keyring can be NULL if func is anything other than KEY_CHECK.
>> + * @func_data: private data specific to @func, can be NULL.
> 
> And again here.
> 
Yes.
> thanks,
> 
> Mimi
> 

Thanks,
Tushar

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

