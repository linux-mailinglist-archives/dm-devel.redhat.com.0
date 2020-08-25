Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 92DDC25281F
	for <lists+dm-devel@lfdr.de>; Wed, 26 Aug 2020 09:04:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-WVcIPxPOO8CCG8ShEfkXBA-1; Wed, 26 Aug 2020 03:04:03 -0400
X-MC-Unique: WVcIPxPOO8CCG8ShEfkXBA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC1BE807335;
	Wed, 26 Aug 2020 07:03:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C457B5C1A3;
	Wed, 26 Aug 2020 07:03:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 403E0EC32;
	Wed, 26 Aug 2020 07:03:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07PHWm7a031977 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 25 Aug 2020 13:32:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 39CE72022792; Tue, 25 Aug 2020 17:32:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A303202279B
	for <dm-devel@redhat.com>; Tue, 25 Aug 2020 17:32:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90786888BE0
	for <dm-devel@redhat.com>; Tue, 25 Aug 2020 17:32:45 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-97-Npy-JbqxOzS2Z9yhTXOSsg-1;
	Tue, 25 Aug 2020 13:32:40 -0400
X-MC-Unique: Npy-JbqxOzS2Z9yhTXOSsg-1
Received: from [192.168.86.21] (c-71-197-163-6.hsd1.wa.comcast.net
	[71.197.163.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id ECFA320B4908;
	Tue, 25 Aug 2020 10:32:38 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com ECFA320B4908
To: Mimi Zohar <zohar@linux.ibm.com>, stephen.smalley.work@gmail.com,
	casey@schaufler-ca.com, agk@redhat.com, snitzer@redhat.com,
	gmazyland@gmail.com
References: <20200821182107.5328-1-tusharsu@linux.microsoft.com>
	<20200821182107.5328-3-tusharsu@linux.microsoft.com>
	<d82c5cdab170d3dcc513b38632801c3aa14ca389.camel@linux.ibm.com>
From: Tushar Sugandhi <tusharsu@linux.microsoft.com>
Message-ID: <e701ad15-1672-d208-c2b8-8228a728c98d@linux.microsoft.com>
Date: Tue, 25 Aug 2020 10:32:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d82c5cdab170d3dcc513b38632801c3aa14ca389.camel@linux.ibm.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 26 Aug 2020 03:03:31 -0400
Cc: sashal@kernel.org, dm-devel@redhat.com, selinux@vger.kernel.org,
	jmorris@namei.org, linux-kernel@vger.kernel.org,
	nramas@linux.microsoft.com, linux-security-module@vger.kernel.org,
	tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v2 2/3] IMA: add policy to support measuring
 critical data from kernel components
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit



On 2020-08-24 3:46 p.m., Mimi Zohar wrote:
> On Fri, 2020-08-21 at 11:21 -0700, Tushar Sugandhi wrote:
>> There would be several candidate kernel components suitable for IMA
>> measurement. Not all of them would have support for IMA measurement.
>> Also, system administrators may not want to measure data for all of
>> them, even when they support IMA measurement. An IMA policy specific
>> to various kernel components is needed to measure their respective
>> critical data.
>>
>> Add a new IMA policy CRITICAL_DATA+data_sources to support measuring
>> various critical kernel components. This policy would enable the
>> system administrators to limit the measurement to the components,
>> if the components support IMA measurement.
>>
>> Signed-off-by: Tushar Sugandhi <tusharsu@linux.microsoft.com>
>> ---
>>   Documentation/ABI/testing/ima_policy |  6 ++-
>>   security/integrity/ima/ima.h         |  1 +
>>   security/integrity/ima/ima_api.c     |  2 +-
>>   security/integrity/ima/ima_policy.c  | 62 +++++++++++++++++++++++++---
>>   4 files changed, 63 insertions(+), 8 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/ima_policy b/Documentation/ABI/testing/ima_policy
>> index cd572912c593..a0dd0f108555 100644
>> --- a/Documentation/ABI/testing/ima_policy
>> +++ b/Documentation/ABI/testing/ima_policy
>> @@ -29,7 +29,7 @@ Description:
>>   		base: 	func:= [BPRM_CHECK][MMAP_CHECK][CREDS_CHECK][FILE_CHECK][MODULE_CHECK]
>>   				[FIRMWARE_CHECK]
>>   				[KEXEC_KERNEL_CHECK] [KEXEC_INITRAMFS_CHECK]
>> -				[KEXEC_CMDLINE] [KEY_CHECK]
>> +				[KEXEC_CMDLINE] [KEY_CHECK] [CRITICAL_DATA]
>>   			mask:= [[^]MAY_READ] [[^]MAY_WRITE] [[^]MAY_APPEND]
>>   			       [[^]MAY_EXEC]
>>   			fsmagic:= hex value
>> @@ -125,3 +125,7 @@ Description:
>>   		keys added to .builtin_trusted_keys or .ima keyring:
>>   
>>   			measure func=KEY_CHECK keyrings=.builtin_trusted_keys|.ima
>> +
>> +		Example of measure rule using CRITICAL_DATA to measure critical data
>> +
>> +			measure func=CRITICAL_DATA data_sources=selinux|apparmor|dm-crypt
> 
> This example uses "data_sources" without first defining it in the
> "option:" section.  Defining two new options is an indication that this
Thanks. I will define "data_sources" first in "option:" section.
> patch should be split up.  One which defines the "CRITICAL_DATA" and
> another one which defines the new key value pair.  The term
I intentionally kept the "CRITICAL_DATA" and "data_sources" in the same
patch.

CRITICAL_DATA is different than KEY_CHECK because in case of KEY_CHECK,
"keyrings=" is optional. If "keyrings=" is not specified, then we
measure all keyrings.

Where for CRITICAL_DATA, "data_sources=" is mandatory.

Because the data sources would be diverse and orthogonal to each other,
(unlike "keyrings=") - not specifying "data_sources=" shouldn't result
in IMA blindly measuring all data sources.

Since CRITICAL_DATA, and "data_sources=" go hand in hand, I wanted them
to be part of the same patch.
> "data_sources" is pretty generic.  Perhaps constrain it a bit by re-
> naming it "critical_data=".  Or was such using a generic name
> intentional?
> 
We intentionally kept the name generic because the data to be measured
could be coming from any kernel component with any granularity (from a
single bool to megabytes of data). The kernel component is also loosely
defined here. It could be an LSM (like SELinux), or a broader base layer
(like device-mapper), or a specific module (like dm-crypt), or it could
be different parts of a single module.

Also, we didn't want to name "data_sources" as "critical_data" to avoid
confusion with func "CRITICAL_DATA".

> Normally "CRITICAL_DATA" would be defined with the critical data hook,
> but that seems to be defined in patch 3/3 "IMA: define IMA hook to
> measure critical data from kernel components".
> 
I can make the "CRITICAL_DATA" and the hook as part of the same patch.
That would mean combining patch 2 and 3 into a single one.

Does it sound ok?
>> diff --git a/security/integrity/ima/ima.h b/security/integrity/ima/ima.h
>> index 8875085db689..0f4209a92bfb 100644
>> --- a/security/integrity/ima/ima.h
>> +++ b/security/integrity/ima/ima.h
>> @@ -200,6 +200,7 @@ static inline unsigned int ima_hash_key(u8 *digest)
>>   	hook(POLICY_CHECK, policy)			\
>>   	hook(KEXEC_CMDLINE, kexec_cmdline)		\
>>   	hook(KEY_CHECK, key)				\
>> +	hook(CRITICAL_DATA, critical_data)		\
>>   	hook(MAX_CHECK, none)
>>   
>>   #define __ima_hook_enumify(ENUM, str)	ENUM,
>> diff --git a/security/integrity/ima/ima_api.c b/security/integrity/ima/ima_api.c
>> index af218babd198..9917e1730cb6 100644
>> --- a/security/integrity/ima/ima_api.c
>> +++ b/security/integrity/ima/ima_api.c
>> @@ -176,7 +176,7 @@ void ima_add_violation(struct file *file, const unsigned char *filename,
>>    *		subj=, obj=, type=, func=, mask=, fsmagic=
>>    *	subj,obj, and type: are LSM specific.
>>    *	func: FILE_CHECK | BPRM_CHECK | CREDS_CHECK | MMAP_CHECK | MODULE_CHECK
>> - *	| KEXEC_CMDLINE | KEY_CHECK
>> + *	| KEXEC_CMDLINE | KEY_CHECK | CRITICAL_DATA
>>    *	mask: contains the permission mask
>>    *	fsmagic: hex value
>>    *
>> diff --git a/security/integrity/ima/ima_policy.c b/security/integrity/ima/ima_policy.c
>> index 8866e84d0062..7b649095ac7a 100644
>> --- a/security/integrity/ima/ima_policy.c
>> +++ b/security/integrity/ima/ima_policy.c
>> @@ -33,6 +33,7 @@
>>   #define IMA_PCR		0x0100
>>   #define IMA_FSNAME	0x0200
>>   #define IMA_KEYRINGS	0x0400
>> +#define IMA_DATA_SOURCES	0x0800
>>   
>>   #define UNKNOWN		0
>>   #define MEASURE		0x0001	/* same as IMA_MEASURE */
>> @@ -84,6 +85,7 @@ struct ima_rule_entry {
>>   	} lsm[MAX_LSM_RULES];
>>   	char *fsname;
>>   	struct ima_rule_opt_list *keyrings; /* Measure keys added to these keyrings */
>> +	struct ima_rule_opt_list *data_sources; /* Measure data from these sources */
>>   	struct ima_template_desc *template;
>>   };
>>   
>> @@ -508,14 +510,23 @@ static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
>>   {
>>   	int i;
>>   
>> -	if (func == KEY_CHECK) {
>> -		return (rule->flags & IMA_FUNC) && (rule->func == func) &&
>> -		       ima_match_rule_data(rule, rule->keyrings, func_data,
>> -					   true, cred);
>> -	}
>>   	if ((rule->flags & IMA_FUNC) &&
>>   	    (rule->func != func && func != POST_SETATTR))
>>   		return false;
>> +
>> +	switch (func) {
>> +	case KEY_CHECK:
>> +		return ((rule->func == func) &&
>> +			ima_match_rule_data(rule, rule->keyrings,
>> +					    func_data, true, cred));
>> +	case CRITICAL_DATA:
>> +		return ((rule->func == func) &&
>> +			ima_match_rule_data(rule, rule->data_sources,
>> +					    func_data, false, cred));
>> +	default:
>> +		break;
>> +	}
>> +
>>   	if ((rule->flags & IMA_MASK) &&
>>   	    (rule->mask != mask && func != POST_SETATTR))
>>   		return false;
>> @@ -911,7 +922,7 @@ enum {
>>   	Opt_uid_lt, Opt_euid_lt, Opt_fowner_lt,
>>   	Opt_appraise_type, Opt_appraise_flag,
>>   	Opt_permit_directio, Opt_pcr, Opt_template, Opt_keyrings,
>> -	Opt_err
>> +	Opt_data_sources, Opt_err
>>   };
>>   
>>   static const match_table_t policy_tokens = {
>> @@ -948,6 +959,7 @@ static const match_table_t policy_tokens = {
>>   	{Opt_pcr, "pcr=%s"},
>>   	{Opt_template, "template=%s"},
>>   	{Opt_keyrings, "keyrings=%s"},
>> +	{Opt_data_sources, "data_sources=%s"},
>>   	{Opt_err, NULL}
>>   };
>>   
>> @@ -1110,6 +1122,19 @@ static bool ima_validate_rule(struct ima_rule_entry *entry)
>>   		if (ima_rule_contains_lsm_cond(entry))
>>   			return false;
>>   
>> +		break;
>> +	case CRITICAL_DATA:
>> +		if (entry->action & ~(MEASURE | DONT_MEASURE))
>> +			return false;
>> +
>> +		if (!(entry->flags & IMA_DATA_SOURCES) ||
>> +		    (entry->flags & ~(IMA_FUNC | IMA_UID | IMA_PCR |
>> +		    IMA_DATA_SOURCES)))
>> +			return false;
> 
> Requiring IMA_FUNC and IMA_DATA_SOURCES makes sense, but why are
> IMA_UID and IMA_PCR required?
> 
Since the data to be measured could be for any scenario, I didn't want
to restrict the kernel components from choosing UID to measure the data
for, or restrict them from choosing PCR to store the measurements in.
But as the consumers are kernel components, perhaps support for IMA_UID
is not required.  But we should still support IMA_PCR.
Please let me know what do you think, and I can update the logic
accordingly.
>> +
>> +		if (ima_rule_contains_lsm_cond(entry))
>> +			return false;
>> +
>>   		break;
>>   	default:
>>   		return false;
>> @@ -1242,6 +1267,8 @@ static int ima_parse_rule(char *rule, struct ima_rule_entry *entry)
>>   			else if (IS_ENABLED(CONFIG_IMA_MEASURE_ASYMMETRIC_KEYS) &&
>>   				 strcmp(args[0].from, "KEY_CHECK") == 0)
>>   				entry->func = KEY_CHECK;
>> +			else if (strcmp(args[0].from, "CRITICAL_DATA") == 0)
>> +				entry->func = CRITICAL_DATA;
>>   			else
>>   				result = -EINVAL;
>>   			if (!result)
>> @@ -1312,6 +1339,23 @@ static int ima_parse_rule(char *rule, struct ima_rule_entry *entry)
>>   
>>   			entry->flags |= IMA_KEYRINGS;
>>   			break;
>> +		case Opt_data_sources:
>> +			ima_log_string(ab, "data_sources", args[0].from);
>> +
>> +			if (entry->data_sources) {
>> +				result = -EINVAL;
>> +				break;
>> +			}
>> +
>> +			entry->data_sources = ima_alloc_rule_opt_list(args);
>> +			if (IS_ERR(entry->data_sources)) {
>> +				result = PTR_ERR(entry->data_sources);
>> +				entry->data_sources = NULL;
>> +				break;
>> +			}
>> +
> 
> "keyrings=" isn't bounded because keyrings can be created by userspace.
> Perhaps keyring names has a minimum/maximum length.  IMA isn't
> measuring userspace construsts.  Shouldn't the list of critical data
> being measured be bounded and verified?
The comment is not entirely clear.
Do you mean there should be some sort of allow_list in IMA, against
which the values in "data_sources=" should be vetted? And if the
value is present in the IMA allow_list, then only the measurements for
that data source are allowed?

Or do you mean something else?

~Tushar
> 
> Mimi
> 
>> +			entry->flags |= IMA_DATA_SOURCES;
>> +			break;
>>   		case Opt_fsuuid:
>>   			ima_log_string(ab, "fsuuid", args[0].from);
>>   
>> @@ -1692,6 +1736,12 @@ int ima_policy_show(struct seq_file *m, void *v)
>>   		seq_puts(m, " ");
>>   	}
>>   
>> +	if (entry->flags & IMA_DATA_SOURCES) {
>> +		seq_puts(m, "data_sources=");
>> +		ima_show_rule_opt_list(m, entry->data_sources);
>> +		seq_puts(m, " ");
>> +	}
>> +
>>   	if (entry->flags & IMA_PCR) {
>>   		snprintf(tbuf, sizeof(tbuf), "%d", entry->pcr);
>>   		seq_printf(m, pt(Opt_pcr), tbuf);
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

