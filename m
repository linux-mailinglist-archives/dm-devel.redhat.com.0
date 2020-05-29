Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9684B1E9FFC
	for <lists+dm-devel@lfdr.de>; Mon,  1 Jun 2020 10:26:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590999972;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0r1d7iEz+Ldqta+cGKcvawgbUcVCDkcZwLJTuF1yUkw=;
	b=QNauMEXzrSj/uxoDfjXdM5ZMs4Rng6QVeMgyoIlZmmZ+5Pk5cBMvPhnBXW5uGFDrkP4VVy
	pRsIvSYYPw9I0IIi/ZZa29aO50ffXaClVl3YdVHuH5oRzM20Ch2A/6DQLWLasj7Jr1XHo5
	9f1l/srd8S9CUqQaO9o2gsPCUOUlSVU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-mroDZO42OtupDlA1kqar9w-1; Mon, 01 Jun 2020 04:26:10 -0400
X-MC-Unique: mroDZO42OtupDlA1kqar9w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D03E8460;
	Mon,  1 Jun 2020 08:26:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F2EFA768DE;
	Mon,  1 Jun 2020 08:26:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BE9A77F21D;
	Mon,  1 Jun 2020 08:25:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04T8admB024403 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 29 May 2020 04:36:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8E9D82157F24; Fri, 29 May 2020 08:36:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 81F072166BA4
	for <dm-devel@redhat.com>; Fri, 29 May 2020 08:36:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11059185A78B
	for <dm-devel@redhat.com>; Fri, 29 May 2020 08:36:37 +0000 (UTC)
Received: from smtp-42ae.mail.infomaniak.ch (smtp-42ae.mail.infomaniak.ch
	[84.16.66.174]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-442-hvAdNykqOia2GCD-9Sdbxw-1; Fri, 29 May 2020 04:36:34 -0400
X-MC-Unique: hvAdNykqOia2GCD-9Sdbxw-1
Received: from smtp-2-0001.mail.infomaniak.ch (unknown [10.5.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id
	49YHXH2hL3zlhf9v; Fri, 29 May 2020 10:18:55 +0200 (CEST)
Received: from ns3096276.ip-94-23-54.eu (unknown [94.23.54.103])
	by smtp-2-0001.mail.infomaniak.ch (Postfix) with ESMTPA id
	49YHXB4XMdzlhC5w; Fri, 29 May 2020 10:18:50 +0200 (CEST)
To: Jaskaran Singh Khurana <jaskarankhurana@linux.microsoft.com>
References: <20200415162550.2324-1-deven.desai@linux.microsoft.com>
	<b07ac7e1-7cf5-92c9-81d0-64174c3d5024@digikod.net>
	<0001755a-6b2a-b13b-960c-eb0b065c8e3c@linux.microsoft.com>
	<8ba7b15f-de91-40f7-fc95-115228345fce@linux.microsoft.com>
	<44fb36ae-959d-4ff7-ed1f-ccfc2e292232@digikod.net>
	<alpine.LRH.2.21.2005161420490.8455@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.inter>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Message-ID: <56a8c084-1496-b465-4f01-99282ac53baf@digikod.net>
Date: Fri, 29 May 2020 10:18:36 +0200
User-Agent: 
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.21.2005161420490.8455@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.inter>
Content-Language: en-US
X-Antivirus: Dr.Web (R) for Unix mail servers drweb plugin ver.6.0.2.8
X-Antivirus-Code: 0x100000
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04T8admB024403
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 01 Jun 2020 04:25:39 -0400
Cc: axboe@kernel.dk, sashal@kernel.org, dm-devel@redhat.com, snitzer@redhat.com,
	jannh@google.com, linux-kernel@vger.kernel.org,
	Deven Bowers <deven.desai@linux.microsoft.com>, corbet@lwn.net,
	pasha.tatashin@soleen.com, jmorris@namei.org,
	zohar@linux.ibm.com, mdsakib@linux.microsoft.com,
	linux-block@vger.kernel.org, nramas@linux.microsoft.com,
	linux-security-module@vger.kernel.org,
	tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org,
	agk@redhat.com, serge@hallyn.com
Subject: Re: [dm-devel] [RFC PATCH v3 00/12] Integrity Policy Enforcement
	LSM (IPE)
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

Hi Jaskaran,

On 17/05/2020 00:14, Jaskaran Singh Khurana wrote:
>=20
> Hello Mickael,
>=20
> On Thu, 14 May 2020, Micka=EBl Sala=FCn wrote:
>=20
>>
>> On 12/05/2020 22:46, Deven Bowers wrote:
>>>
>>>
>>> On 5/11/2020 11:03 AM, Deven Bowers wrote:
>>>>
>>>>
>>>> On 5/10/2020 2:28 AM, Micka=EBl Sala=FCn wrote:
>>>>
>>>> [...snip]
>>>>
>>>>>>
>>>>>> Additionally, rules are evaluated top-to-bottom. As a result, any
>>>>>> revocation rules, or denies should be placed early in the file to
>>>>>> ensure
>>>>>> that these rules are evaluated before a rule with "action=3DALLOW" i=
s
>>>>>> hit.
>>>>>>
>>>>>> IPE policy is designed to be forward compatible and backwards
>>>>>> compatible,
>>>>>> thus any failure to parse a rule will result in the line being
>>>>>> ignored,
>>>>>> and a warning being emitted. If backwards compatibility is not
>>>>>> required,
>>>>>> the kernel commandline parameter and sysctl, ipe.strict_parse can be
>>>>>> enabled, which will cause these warnings to be fatal.
>>>>>
>>>>> Ignoring unknown command may lead to inconsistent beaviors. To achiev=
e
>>>>> forward compatibility, I think it would be better to never ignore
>>>>> unknown rule but to give a way to userspace to known what is the
>>>>> current
>>>>> kernel ABI. This could be done with a securityfs file listing the
>>>>> current policy grammar.
>>>>>
>>>>
>>>> That's a fair point. From a manual perspective, I think this is fine.
>>>> A human-user can interpret a grammar successfully on their own when ne=
w
>>>> syntax is introduced.
>>>>
>>>> =A0From a producing API perspective, I'd have to think about it a bit
>>>> more. Ideally, the grammar would be structured in such a way that the
>>>> userland
>>>> interpreter of this grammar would not have to be updated once new
>>>> syntax
>>>> is introduced, avoiding the need to update the userland binary. To
>>>> do so
>>>> generically ("op=3D%s") is easy, but doesn't necessarily convey
>>>> sufficient
>>>> information (what happens when a new "op" token is introduced?). I
>>>> think
>>>> this may come down to regular expression representations of valid
>>>> values
>>>> for these tokens, which worries me as regular expressions are
>>>> incredibly
>>>> error-prone[1].
>>>>
>>>> I'll see what I can come up with regarding this.
>>>
>>> I have not found a way that I like to expose some kind of grammar
>>> through securityfs that can be understood by usermode to parse the
>>> policy. Here's what I propose as a compromise:
>>>
>>> =A0=A0=A0=A01. I remove the unknown command behavior. This address your
>>> first point about inconsistent behaviors, and effectively removes the
>>> strict_parse sysctl (as it is always enabled).
>>>
>>> =A0=A0=A0=A02. I introduce a versioning system for the properties
>>> themselves. The valid set of properties and their versions
>>> can be found in securityfs, under say, ipe/config in a key=3Dvalue
>>> format where `key` indicates the understood token, and `value`
>>> indicates their current version. For example:
>>>
>>> =A0=A0=A0=A0$ cat $SECURITYFS/ipe/config
>>> =A0=A0=A0=A0op=3D1
>>> =A0=A0=A0=A0action=3D1
>>> =A0=A0=A0=A0policy_name=3D1
>>> =A0=A0=A0=A0policy_version=3D1
>>> =A0=A0=A0=A0dmverity_signature=3D1
>>> =A0=A0=A0=A0dmverity_roothash=3D1
>>> =A0=A0=A0=A0boot_verified=3D1
>>
>> The name ipe/config sounds like a file to configure IPE. Maybe something
>> like ipe/config_abi or ipe/config_grammar?
>>
>>>
>>> if new syntax is introduced, the version number is increased.
>>>
>>> =A0=A0=A0=A03. The format of those versions are documented as part of
>>> the admin-guide around IPE. If user-mode at that point wants to rip
>>> the documentation formats and correlate with the versioning, then
>>> it fulfills the same functionality as above, with out the complexity
>>> around exposing a parsing grammar and interpreting it on-the-fly.
>>> Many of these are unlikely to move past version 1, however.
>>>
>>> Thoughts?
>>>
>>
>> That seems reasonable.
>>
>=20
> There is a use case for not having strict parsing in the cloud world
> where there are multiple versions of OS deployed across a large number
> of systems say 100,000 nodes. An OS update can take weeks to complete
> across all the nodes, and we end up having a heterogeneous mix of OS
> versions.
>=20
> Without non-strict parsing, to fix an issue in a policy we will need to
> update the various versions of the policy (one each for all OS versions
> which have different IPE policy schema). We will lose the agility we
> need to fix and deploy something urgently in the policy, the nodes might
> be failing some critical workloads meanwhile. All the various versions
> of the policy will need to be changed and production signed then
> deployed etc. Further some versions might introduce newer issues and we
> will need to see what all versions of the policy have that bug.

What can be done in the kernel to ignore some policy rules could also be
done in a tool managing different policies. For instance, a simple tool
can instantiate a human-written policy into multiple backward compatible
policies (according to different versions of supported kernels). The
appropriate policy could then be fetched on the fly by the nodes or
pushed by an orchestration system.

>=20
> I propose keeping the non-strict option as well to cater to this use
> case. Let me know your thoughts on this.

With your constraints in mind, I still think that flexible policy
management can be achieved with strict kernel policy parsing. The
complexity should be handled by infrastructure management system.

>=20
> Regards,
> JK


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

