Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 059BB1D7361
	for <lists+dm-devel@lfdr.de>; Mon, 18 May 2020 11:00:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589792401;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=6iaOpEGaFfibiBvzwS8a0WMD8ThEsI71D4t0yU/heeg=;
	b=JAeVCIAL1S4hWUhNUd90HWnd1lXpoMtj+DnRE6oZZjbWoP3xzGoazN0YRls7aTCXhwkF+W
	EXWQGPqD8oMHUG8mdObDCNkcR42eezMgq8+VWXSAw+EdUv5zIzCU/gZYNgU7cIlJ238kiF
	u2NiEM1PoBBt3rY61M46klm/dHuIuH0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-5zJf14XJPeihA0Z3ZE4tLQ-1; Mon, 18 May 2020 04:59:58 -0400
X-MC-Unique: 5zJf14XJPeihA0Z3ZE4tLQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBD138730A1;
	Mon, 18 May 2020 08:59:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1ABD55C1D6;
	Mon, 18 May 2020 08:59:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0A9634ED39;
	Mon, 18 May 2020 08:59:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04GMLg7p009632 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 16 May 2020 18:21:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6EEDA2026972; Sat, 16 May 2020 22:21:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B0EF20110C9
	for <dm-devel@redhat.com>; Sat, 16 May 2020 22:21:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1B6F800821
	for <dm-devel@redhat.com>; Sat, 16 May 2020 22:21:39 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-84-U9oyJGbSMJaSivg0B6ZnVg-1;
	Sat, 16 May 2020 18:21:35 -0400
X-MC-Unique: U9oyJGbSMJaSivg0B6ZnVg-1
Received: by linux.microsoft.com (Postfix, from userid 1029)
	id BE57820B717B; Sat, 16 May 2020 15:14:17 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BE57820B717B
Received: from localhost (localhost [127.0.0.1])
	by linux.microsoft.com (Postfix) with ESMTP id B34633070322;
	Sat, 16 May 2020 15:14:17 -0700 (PDT)
Date: Sat, 16 May 2020 15:14:17 -0700 (PDT)
From: Jaskaran Singh Khurana <jaskarankhurana@linux.microsoft.com>
X-X-Sender: jaskarankhurana@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
To: =?ISO-8859-15?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
In-Reply-To: <44fb36ae-959d-4ff7-ed1f-ccfc2e292232@digikod.net>
Message-ID: <alpine.LRH.2.21.2005161420490.8455@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.inter>
References: <20200415162550.2324-1-deven.desai@linux.microsoft.com>
	<b07ac7e1-7cf5-92c9-81d0-64174c3d5024@digikod.net>
	<0001755a-6b2a-b13b-960c-eb0b065c8e3c@linux.microsoft.com>
	<8ba7b15f-de91-40f7-fc95-115228345fce@linux.microsoft.com>
	<44fb36ae-959d-4ff7-ed1f-ccfc2e292232@digikod.net>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 18 May 2020 04:59:34 -0400
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="656392-2094691721-1589667257=:8455"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
--656392-2094691721-1589667257=:8455
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: quoted-printable


Hello Mickael,

On Thu, 14 May 2020, Micka=EBl Sala=FCn wrote:

>
> On 12/05/2020 22:46, Deven Bowers wrote:
>>
>>
>> On 5/11/2020 11:03 AM, Deven Bowers wrote:
>>>
>>>
>>> On 5/10/2020 2:28 AM, Micka=EBl Sala=FCn wrote:
>>>
>>> [...snip]
>>>
>>>>>
>>>>> Additionally, rules are evaluated top-to-bottom. As a result, any
>>>>> revocation rules, or denies should be placed early in the file to
>>>>> ensure
>>>>> that these rules are evaluated before a rule with "action=3DALLOW" is
>>>>> hit.
>>>>>
>>>>> IPE policy is designed to be forward compatible and backwards
>>>>> compatible,
>>>>> thus any failure to parse a rule will result in the line being ignore=
d,
>>>>> and a warning being emitted. If backwards compatibility is not
>>>>> required,
>>>>> the kernel commandline parameter and sysctl, ipe.strict_parse can be
>>>>> enabled, which will cause these warnings to be fatal.
>>>>
>>>> Ignoring unknown command may lead to inconsistent beaviors. To achieve
>>>> forward compatibility, I think it would be better to never ignore
>>>> unknown rule but to give a way to userspace to known what is the curre=
nt
>>>> kernel ABI. This could be done with a securityfs file listing the
>>>> current policy grammar.
>>>>
>>>
>>> That's a fair point. From a manual perspective, I think this is fine.
>>> A human-user can interpret a grammar successfully on their own when new
>>> syntax is introduced.
>>>
>>> =A0From a producing API perspective, I'd have to think about it a bit
>>> more. Ideally, the grammar would be structured in such a way that the
>>> userland
>>> interpreter of this grammar would not have to be updated once new synta=
x
>>> is introduced, avoiding the need to update the userland binary. To do s=
o
>>> generically ("op=3D%s") is easy, but doesn't necessarily convey suffici=
ent
>>> information (what happens when a new "op" token is introduced?). I thin=
k
>>> this may come down to regular expression representations of valid value=
s
>>> for these tokens, which worries me as regular expressions are incredibl=
y
>>> error-prone[1].
>>>
>>> I'll see what I can come up with regarding this.
>>
>> I have not found a way that I like to expose some kind of grammar
>> through securityfs that can be understood by usermode to parse the
>> policy. Here's what I propose as a compromise:
>>
>> =A0=A0=A0=A01. I remove the unknown command behavior. This address your
>> first point about inconsistent behaviors, and effectively removes the
>> strict_parse sysctl (as it is always enabled).
>>
>> =A0=A0=A0=A02. I introduce a versioning system for the properties
>> themselves. The valid set of properties and their versions
>> can be found in securityfs, under say, ipe/config in a key=3Dvalue
>> format where `key` indicates the understood token, and `value`
>> indicates their current version. For example:
>>
>> =A0=A0=A0=A0$ cat $SECURITYFS/ipe/config
>> =A0=A0=A0=A0op=3D1
>> =A0=A0=A0=A0action=3D1
>> =A0=A0=A0=A0policy_name=3D1
>> =A0=A0=A0=A0policy_version=3D1
>> =A0=A0=A0=A0dmverity_signature=3D1
>> =A0=A0=A0=A0dmverity_roothash=3D1
>> =A0=A0=A0=A0boot_verified=3D1
>
> The name ipe/config sounds like a file to configure IPE. Maybe something
> like ipe/config_abi or ipe/config_grammar?
>
>>
>> if new syntax is introduced, the version number is increased.
>>
>> =A0=A0=A0=A03. The format of those versions are documented as part of
>> the admin-guide around IPE. If user-mode at that point wants to rip
>> the documentation formats and correlate with the versioning, then
>> it fulfills the same functionality as above, with out the complexity
>> around exposing a parsing grammar and interpreting it on-the-fly.
>> Many of these are unlikely to move past version 1, however.
>>
>> Thoughts?
>>
>
> That seems reasonable.
>

There is a use case for not having strict parsing in the cloud world where=
=20
there are multiple versions of OS deployed across a large number of=20
systems say 100,000 nodes. An OS update can take weeks to complete=20
across all the nodes, and we end up having a heterogeneous mix of OS=20
versions.

Without non-strict parsing, to fix an issue in a policy we will need to=20
update the various versions of the policy (one each for all OS versions
which have different IPE policy schema). We will lose the agility we=20
need to fix and deploy something urgently in the policy, the nodes might=20
be failing some critical workloads meanwhile. All the various versions of=
=20
the policy will need to be changed and production signed then deployed=20
etc. Further some versions might introduce newer issues and we will need=20
to see what all versions of the policy have that bug.

I propose keeping the non-strict option as well to cater to this use case.=
=20
Let me know your thoughts on this.

Regards,
JK
--656392-2094691721-1589667257=:8455
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--656392-2094691721-1589667257=:8455--

