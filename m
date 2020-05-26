Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 77FA01E36F8
	for <lists+dm-devel@lfdr.de>; Wed, 27 May 2020 06:15:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590552917;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=lRCtm0m+idwEannvtGC74yuIwWPn+3TV3x9vttWeqQc=;
	b=If6G45SDOWoxd8fCL2+wLSpSxuhuq4tqzzC97pqQ2FKCE0Lvz2F4cjjbLDo5HE3SO30Skh
	WQgYRu5W4lAtnWPmkSIBpsot7c6t9Qq7x5MK1RR7BnfABSs4nsEV9Hh+9giODq5E0q2CfL
	wo141hBTe54Vxbt839r52aYCbfUEVFI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-fgs1ZkSjMHW-p7BKU6nXgQ-1; Wed, 27 May 2020 00:15:14 -0400
X-MC-Unique: fgs1ZkSjMHW-p7BKU6nXgQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B21784B8A1;
	Wed, 27 May 2020 04:15:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C77712A4D;
	Wed, 27 May 2020 04:15:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 611F41809541;
	Wed, 27 May 2020 04:14:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04QKiq8N013065 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 26 May 2020 16:44:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3A0498A4D0; Tue, 26 May 2020 20:44:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 26A7A8A4CE
	for <dm-devel@redhat.com>; Tue, 26 May 2020 20:44:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F0D4108C267
	for <dm-devel@redhat.com>; Tue, 26 May 2020 20:44:49 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-120-MFFheGt0P0m48oCQiANlog-1;
	Tue, 26 May 2020 16:44:46 -0400
X-MC-Unique: MFFheGt0P0m48oCQiANlog-1
Received: by linux.microsoft.com (Postfix, from userid 1029)
	id 2C25420B717B; Tue, 26 May 2020 13:44:45 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2C25420B717B
Received: from localhost (localhost [127.0.0.1])
	by linux.microsoft.com (Postfix) with ESMTP id 284A430705CE;
	Tue, 26 May 2020 13:44:45 -0700 (PDT)
Date: Tue, 26 May 2020 13:44:45 -0700 (PDT)
From: Jaskaran Singh Khurana <jaskarankhurana@linux.microsoft.com>
X-X-Sender: jaskarankhurana@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
To: =?ISO-8859-15?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
In-Reply-To: <alpine.LRH.2.21.2005161420490.8455@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.inter>
Message-ID: <alpine.LRH.2.21.2005261343540.83057@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.inter>
References: <20200415162550.2324-1-deven.desai@linux.microsoft.com>
	<b07ac7e1-7cf5-92c9-81d0-64174c3d5024@digikod.net>
	<0001755a-6b2a-b13b-960c-eb0b065c8e3c@linux.microsoft.com>
	<8ba7b15f-de91-40f7-fc95-115228345fce@linux.microsoft.com>
	<44fb36ae-959d-4ff7-ed1f-ccfc2e292232@digikod.net>
	<alpine.LRH.2.21.2005161420490.8455@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.inter>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 27 May 2020 00:14:46 -0400
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="656392-1229694672-1590525885=:83057"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
--656392-1229694672-1590525885=:83057
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: quoted-printable

Hello Mickael,

Could you please share your thoughts for the below proposal.

Regards,
JK

On Sat, 16 May 2020, Jaskaran Singh Khurana wrote:

>
> Hello Mickael,
>
> On Thu, 14 May 2020, Micka=EBl Sala=FCn wrote:
>
>>
>>  On 12/05/2020 22:46, Deven Bowers wrote:
>>>=20
>>>
>>>  On 5/11/2020 11:03 AM, Deven Bowers wrote:
>>>>=20
>>>>
>>>>  On 5/10/2020 2:28 AM, Micka=EBl Sala=FCn wrote:
>>>>
>>>>  [...snip]
>>>>=20
>>>>>>
>>>>>>  Additionally, rules are evaluated top-to-bottom. As a result, any
>>>>>>  revocation rules, or denies should be placed early in the file to
>>>>>>  ensure
>>>>>>  that these rules are evaluated before a rule with "action=3DALLOW" =
is
>>>>>>  hit.
>>>>>>
>>>>>>  IPE policy is designed to be forward compatible and backwards
>>>>>>  compatible,
>>>>>>  thus any failure to parse a rule will result in the line being
>>>>>>  ignored,
>>>>>>  and a warning being emitted. If backwards compatibility is not
>>>>>>  required,
>>>>>>  the kernel commandline parameter and sysctl, ipe.strict_parse can b=
e
>>>>>>  enabled, which will cause these warnings to be fatal.
>>>>>
>>>>>  Ignoring unknown command may lead to inconsistent beaviors. To achie=
ve
>>>>>  forward compatibility, I think it would be better to never ignore
>>>>>  unknown rule but to give a way to userspace to known what is the
>>>>>  current
>>>>>  kernel ABI. This could be done with a securityfs file listing the
>>>>>  current policy grammar.
>>>>>=20
>>>>
>>>>  That's a fair point. From a manual perspective, I think this is fine.
>>>>  A human-user can interpret a grammar successfully on their own when n=
ew
>>>>  syntax is introduced.
>>>>
>>>>  =A0From a producing API perspective, I'd have to think about it a bit
>>>>  more. Ideally, the grammar would be structured in such a way that the
>>>>  userland
>>>>  interpreter of this grammar would not have to be updated once new syn=
tax
>>>>  is introduced, avoiding the need to update the userland binary. To do=
 so
>>>>  generically ("op=3D%s") is easy, but doesn't necessarily convey suffi=
cient
>>>>  information (what happens when a new "op" token is introduced?). I th=
ink
>>>>  this may come down to regular expression representations of valid val=
ues
>>>>  for these tokens, which worries me as regular expressions are incredi=
bly
>>>>  error-prone[1].
>>>>
>>>>  I'll see what I can come up with regarding this.
>>>
>>>  I have not found a way that I like to expose some kind of grammar
>>>  through securityfs that can be understood by usermode to parse the
>>>  policy. Here's what I propose as a compromise:
>>>
>>>  =A0=A0=A0=A01. I remove the unknown command behavior. This address you=
r
>>>  first point about inconsistent behaviors, and effectively removes the
>>>  strict_parse sysctl (as it is always enabled).
>>>
>>>  =A0=A0=A0=A02. I introduce a versioning system for the properties
>>>  themselves. The valid set of properties and their versions
>>>  can be found in securityfs, under say, ipe/config in a key=3Dvalue
>>>  format where `key` indicates the understood token, and `value`
>>>  indicates their current version. For example:
>>>
>>>  =A0=A0=A0=A0$ cat $SECURITYFS/ipe/config
>>>  =A0=A0=A0=A0op=3D1
>>>  =A0=A0=A0=A0action=3D1
>>>  =A0=A0=A0=A0policy_name=3D1
>>>  =A0=A0=A0=A0policy_version=3D1
>>>  =A0=A0=A0=A0dmverity_signature=3D1
>>>  =A0=A0=A0=A0dmverity_roothash=3D1
>>>  =A0=A0=A0=A0boot_verified=3D1
>>
>>  The name ipe/config sounds like a file to configure IPE. Maybe somethin=
g
>>  like ipe/config_abi or ipe/config_grammar?
>>=20
>>>
>>>  if new syntax is introduced, the version number is increased.
>>>
>>>  =A0=A0=A0=A03. The format of those versions are documented as part of
>>>  the admin-guide around IPE. If user-mode at that point wants to rip
>>>  the documentation formats and correlate with the versioning, then
>>>  it fulfills the same functionality as above, with out the complexity
>>>  around exposing a parsing grammar and interpreting it on-the-fly.
>>>  Many of these are unlikely to move past version 1, however.
>>>
>>>  Thoughts?
>>>=20
>>
>>  That seems reasonable.
>>=20
>
> There is a use case for not having strict parsing in the cloud world wher=
e=20
> there are multiple versions of OS deployed across a large number of syste=
ms=20
> say 100,000 nodes. An OS update can take weeks to complete across all the=
=20
> nodes, and we end up having a heterogeneous mix of OS versions.
>
> Without non-strict parsing, to fix an issue in a policy we will need to=
=20
> update the various versions of the policy (one each for all OS versions
> which have different IPE policy schema). We will lose the agility we need=
 to=20
> fix and deploy something urgently in the policy, the nodes might be faili=
ng=20
> some critical workloads meanwhile. All the various versions of the policy=
=20
> will need to be changed and production signed then deployed etc. Further =
some=20
> versions might introduce newer issues and we will need to see what all=20
> versions of the policy have that bug.
>
> I propose keeping the non-strict option as well to cater to this use case=
.=20
> Let me know your thoughts on this.
>
> Regards,
> JK
>
--656392-1229694672-1590525885=:83057
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--656392-1229694672-1590525885=:83057--

