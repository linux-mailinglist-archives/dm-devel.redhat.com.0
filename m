Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8E43D2AAC82
	for <lists+dm-devel@lfdr.de>; Sun,  8 Nov 2020 18:06:09 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-zRJ-iIuZOJqZvvNA2Lpc5g-1; Sun, 08 Nov 2020 12:05:27 -0500
X-MC-Unique: zRJ-iIuZOJqZvvNA2Lpc5g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DC791074661;
	Sun,  8 Nov 2020 17:05:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B00C6CE61;
	Sun,  8 Nov 2020 17:05:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DE96A181A270;
	Sun,  8 Nov 2020 17:05:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A6Nq5vu028655 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 6 Nov 2020 18:52:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 88BDD2142F4C; Fri,  6 Nov 2020 23:52:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 839602142F4A
	for <dm-devel@redhat.com>; Fri,  6 Nov 2020 23:52:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53644185A78B
	for <dm-devel@redhat.com>; Fri,  6 Nov 2020 23:52:02 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-411-Fja3AvawMY6pjRo17pQQgQ-1;
	Fri, 06 Nov 2020 18:51:58 -0500
X-MC-Unique: Fja3AvawMY6pjRo17pQQgQ-1
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
	[73.42.176.67])
	by linux.microsoft.com (Postfix) with ESMTPSA id 65C7C20B4905;
	Fri,  6 Nov 2020 15:51:56 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 65C7C20B4905
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
To: Mimi Zohar <zohar@linux.ibm.com>,
	Tushar Sugandhi <tusharsu@linux.microsoft.com>,
	stephen.smalley.work@gmail.com, casey@schaufler-ca.com, agk@redhat.com, 
	snitzer@redhat.com, gmazyland@gmail.com, paul@paul-moore.com
References: <20201101222626.6111-1-tusharsu@linux.microsoft.com>
	<20201101222626.6111-7-tusharsu@linux.microsoft.com>
	<7219f4404bc1bed6eb090b94363c283ec3266a17.camel@linux.ibm.com>
	<cdcd63f7-ce1f-4463-f886-c36832d7a706@linux.microsoft.com>
Message-ID: <d92869b5-7244-e29e-5d30-c0e06cf45be1@linux.microsoft.com>
Date: Fri, 6 Nov 2020 15:51:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cdcd63f7-ce1f-4463-f886-c36832d7a706@linux.microsoft.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0A6Nq5vu028655
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Sun, 08 Nov 2020 12:04:49 -0500
Cc: sashal@kernel.org, dm-devel@redhat.com, selinux@vger.kernel.org,
	jmorris@namei.org, linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v5 6/7] IMA: add critical_data to the
 built-in policy rules
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-15"; Format="flowed"

On 11/6/20 7:37 AM, Lakshmi Ramasubramanian wrote:

Hi Mimi,

>=20
>> Hi Lakshmi, Tushar,
>>
>> This patch defines a new critical_data builtin policy.=A0 Please update
>> the Subject line.
>>
>> On Sun, 2020-11-01 at 14:26 -0800, Tushar Sugandhi wrote:
>>> From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
>>>
>>> The IMA hook to measure kernel critical data, namely
>>> ima_measure_critical_data(), could be called before a custom IMA policy
>>> is loaded. For example, SELinux calls ima_measure_critical_data() to
>>> measure its state and policy when they are initialized. This occurs
>>> before a custom IMA policy is loaded, and hence IMA hook will not
>>> measure the data. A built-in policy is therefore needed to measure
>>> critical data provided by callers before a custom IMA policy is loaded.
>>
>> ^Define a new critical data builtin policy to allow measuring early
>> kernel integrity critical data before a custom IMA policy is loaded.
>=20
> I will add the above line in the patch description.
>=20
>>
>> Either remove the references to SELinux or move this patch after the
>> subsequent patch which measures SELinux critical data.
>=20
> I will remove the reference to SELinux.
> I think it would be better to have this patch before the SELinux=20
> measurement patch.
>=20
>>
>>>
>>> Add CRITICAL_DATA to built-in IMA rules if the kernel command line
>>> contains "ima_policy=3Dcritical_data". Set the IMA template for this ru=
le
>>> to "ima-buf" since ima_measure_critical_data() measures a buffer.
>>>
>>> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
>>
>>> ---
>>> =A0 security/integrity/ima/ima_policy.c | 32 ++++++++++++++++++++++++++=
+++
>>> =A0 1 file changed, 32 insertions(+)
>>>
>>> diff --git a/security/integrity/ima/ima_policy.c=20
>>> b/security/integrity/ima/ima_policy.c
>>> index ec99e0bb6c6f..dc8fe969d3fe 100644
>>> --- a/security/integrity/ima/ima_policy.c
>>> +++ b/security/integrity/ima/ima_policy.c
>>
>>> @@ -875,6 +884,29 @@ void __init ima_init_policy(void)
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ARRAY_SIZE(default_apprai=
se_rules),
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 IMA_DEFAULT_POLICY);
>>> +=A0=A0=A0 if (ima_use_critical_data) {
>>> +=A0=A0=A0=A0=A0=A0=A0 template =3D lookup_template_desc("ima-buf");
>>> +=A0=A0=A0=A0=A0=A0=A0 if (!template) {
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D -EINVAL;
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto out;
>>> +=A0=A0=A0=A0=A0=A0=A0 }
>>> +
>>> +=A0=A0=A0=A0=A0=A0=A0 ret =3D template_desc_init_fields(template->fmt,
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
&(template->fields),
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
&(template->num_fields));
>>
>> The default IMA template when measuring buffer data is "ima_buf".=A0=A0 =
Is
>> there a reason for allocating and initializing it here and not
>> deferring it until process_buffer_measurement()?
>>
>=20
> You are right - good catch.
> I will remove the above and validate.
>=20

process_buffer_measurement() allocates and initializes "ima-buf"=20
template only when the parameter "func" is NONE. Currently, only=20
ima_check_blacklist() passes NONE for func when calling=20
process_buffer_measurement().

If "func" is anything other than NONE, ima_match_policy() picks
the default IMA template if the IMA policy rule does not specify a template=
.

We need to add "ima-buf" in the built-in policy for critical_data so=20
that the default template is not used for buffer measurement.

Please let me know if I am missing something.

thanks,
  -lakshmi

>>
>>> +=A0=A0=A0=A0=A0=A0=A0 if (ret)
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto out;
>>> +
>>> +=A0=A0=A0=A0=A0=A0=A0 critical_data_rules[0].template =3D template;
>>> +=A0=A0=A0=A0=A0=A0=A0 add_rules(critical_data_rules,
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ARRAY_SIZE(critical_data_rules=
),
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 IMA_DEFAULT_POLICY);
>>> +=A0=A0=A0 }
>>> +
>>> +out:
>>> +=A0=A0=A0 if (ret)
>>> +=A0=A0=A0=A0=A0=A0=A0 pr_err("%s failed, result: %d\n", __func__, ret)=
;
>>> +
>>> =A0=A0=A0=A0=A0 ima_update_policy_flag();
>>> =A0 }
>>
>=20


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

