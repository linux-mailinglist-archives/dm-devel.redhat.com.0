Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5CF511D46DF
	for <lists+dm-devel@lfdr.de>; Fri, 15 May 2020 09:15:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589526955;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=anPL6ICmRYH9AEX6W4x4T5M05MnfAEKnZ8P1mCoGVy8=;
	b=OKoIdACTQII/FfhHJPfM2vLoMVd+Acfko/c9UA+VoCxmdL6jQax4aUx6MA0Ino6g4MNkC0
	WfXpX+SU6qKgElC5f24i3Pekq586rAnFo3+ajPvft/YCfIa/Q132ILwQeQILnmn7Glborn
	K62u/oLLWkzz9mErXNjE9enMvenS0K8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-cV6Q0p3nMZukS5UxazvgWw-1; Fri, 15 May 2020 03:15:52 -0400
X-MC-Unique: cV6Q0p3nMZukS5UxazvgWw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A865E800053;
	Fri, 15 May 2020 07:15:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CD2E2E163;
	Fri, 15 May 2020 07:15:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9D66D1809543;
	Fri, 15 May 2020 07:15:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04EJSQXe002023 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 14 May 2020 15:28:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7BBE71007A51; Thu, 14 May 2020 19:28:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0185510336FB
	for <dm-devel@redhat.com>; Thu, 14 May 2020 19:28:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D358218E0AC2
	for <dm-devel@redhat.com>; Thu, 14 May 2020 19:28:21 +0000 (UTC)
Received: from smtp-bc0f.mail.infomaniak.ch (smtp-bc0f.mail.infomaniak.ch
	[45.157.188.15]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-9-nkcTZxJgOTaVPJbJFwv6qA-1; Thu, 14 May 2020 15:28:19 -0400
X-MC-Unique: nkcTZxJgOTaVPJbJFwv6qA-1
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [10.4.36.107])
	by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id
	49NM5Y60DmzlhGVS; Thu, 14 May 2020 21:28:17 +0200 (CEST)
Received: from ns3096276.ip-94-23-54.eu (unknown [94.23.54.103])
	by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id
	49NM5X23j6zljVWn; Thu, 14 May 2020 21:28:16 +0200 (CEST)
To: Deven Bowers <deven.desai@linux.microsoft.com>, agk@redhat.com,
	axboe@kernel.dk, snitzer@redhat.com, jmorris@namei.org,
	serge@hallyn.com, zohar@linux.ibm.com, linux-integrity@vger.kernel.org, 
	linux-security-module@vger.kernel.org, dm-devel@redhat.com,
	linux-block@vger.kernel.org, jannh@google.com
References: <20200415162550.2324-1-deven.desai@linux.microsoft.com>
	<b07ac7e1-7cf5-92c9-81d0-64174c3d5024@digikod.net>
	<0001755a-6b2a-b13b-960c-eb0b065c8e3c@linux.microsoft.com>
	<8ba7b15f-de91-40f7-fc95-115228345fce@linux.microsoft.com>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Message-ID: <44fb36ae-959d-4ff7-ed1f-ccfc2e292232@digikod.net>
Date: Thu, 14 May 2020 21:28:15 +0200
User-Agent: 
MIME-Version: 1.0
In-Reply-To: <8ba7b15f-de91-40f7-fc95-115228345fce@linux.microsoft.com>
Content-Language: en-US
X-Antivirus: Dr.Web (R) for Unix mail servers drweb plugin ver.6.0.2.8
X-Antivirus-Code: 0x100000
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04EJSQXe002023
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 15 May 2020 03:15:32 -0400
Cc: sashal@kernel.org, pasha.tatashin@soleen.com, corbet@lwn.net,
	mdsakib@linux.microsoft.com, linux-kernel@vger.kernel.org,
	nramas@linux.microsoft.com, tyhicks@linux.microsoft.com,
	jaskarankhurana@linux.microsoft.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable


On 12/05/2020 22:46, Deven Bowers wrote:
>=20
>=20
> On 5/11/2020 11:03 AM, Deven Bowers wrote:
>>
>>
>> On 5/10/2020 2:28 AM, Micka=EBl Sala=FCn wrote:
>>
>> [...snip]
>>
>>>>
>>>> Additionally, rules are evaluated top-to-bottom. As a result, any
>>>> revocation rules, or denies should be placed early in the file to
>>>> ensure
>>>> that these rules are evaluated before a rule with "action=3DALLOW" is
>>>> hit.
>>>>
>>>> IPE policy is designed to be forward compatible and backwards
>>>> compatible,
>>>> thus any failure to parse a rule will result in the line being ignored=
,
>>>> and a warning being emitted. If backwards compatibility is not
>>>> required,
>>>> the kernel commandline parameter and sysctl, ipe.strict_parse can be
>>>> enabled, which will cause these warnings to be fatal.
>>>
>>> Ignoring unknown command may lead to inconsistent beaviors. To achieve
>>> forward compatibility, I think it would be better to never ignore
>>> unknown rule but to give a way to userspace to known what is the curren=
t
>>> kernel ABI. This could be done with a securityfs file listing the
>>> current policy grammar.
>>>
>>
>> That's a fair point. From a manual perspective, I think this is fine.
>> A human-user can interpret a grammar successfully on their own when new
>> syntax is introduced.
>>
>> =A0From a producing API perspective, I'd have to think about it a bit
>> more. Ideally, the grammar would be structured in such a way that the
>> userland
>> interpreter of this grammar would not have to be updated once new syntax
>> is introduced, avoiding the need to update the userland binary. To do so
>> generically ("op=3D%s") is easy, but doesn't necessarily convey sufficie=
nt
>> information (what happens when a new "op" token is introduced?). I think
>> this may come down to regular expression representations of valid values
>> for these tokens, which worries me as regular expressions are incredibly
>> error-prone[1].
>>
>> I'll see what I can come up with regarding this.
>=20
> I have not found a way that I like to expose some kind of grammar
> through securityfs that can be understood by usermode to parse the
> policy. Here's what I propose as a compromise:
>=20
> =A0=A0=A0=A01. I remove the unknown command behavior. This address your
> first point about inconsistent behaviors, and effectively removes the
> strict_parse sysctl (as it is always enabled).
>=20
> =A0=A0=A0=A02. I introduce a versioning system for the properties
> themselves. The valid set of properties and their versions
> can be found in securityfs, under say, ipe/config in a key=3Dvalue
> format where `key` indicates the understood token, and `value`
> indicates their current version. For example:
>=20
> =A0=A0=A0=A0$ cat $SECURITYFS/ipe/config
> =A0=A0=A0=A0op=3D1
> =A0=A0=A0=A0action=3D1
> =A0=A0=A0=A0policy_name=3D1
> =A0=A0=A0=A0policy_version=3D1
> =A0=A0=A0=A0dmverity_signature=3D1
> =A0=A0=A0=A0dmverity_roothash=3D1
> =A0=A0=A0=A0boot_verified=3D1

The name ipe/config sounds like a file to configure IPE. Maybe something
like ipe/config_abi or ipe/config_grammar?

>=20
> if new syntax is introduced, the version number is increased.
>=20
> =A0=A0=A0=A03. The format of those versions are documented as part of
> the admin-guide around IPE. If user-mode at that point wants to rip
> the documentation formats and correlate with the versioning, then
> it fulfills the same functionality as above, with out the complexity
> around exposing a parsing grammar and interpreting it on-the-fly.
> Many of these are unlikely to move past version 1, however.
>=20
> Thoughts?
>=20

That seems reasonable.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

