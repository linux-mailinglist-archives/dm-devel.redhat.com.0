Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 3CBE11CFFC1
	for <lists+dm-devel@lfdr.de>; Tue, 12 May 2020 22:46:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589316394;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=34oszPCHESikPyRhKeTfHs8L/qtnwnb2WAx/hR8k3WQ=;
	b=VFg/dRp35Fx9MTCWbZxgTJk85zJ3YZ7ccfkKcBuMlBUMikdto+9mzuKQ/nKr8jKf9oP2kC
	VjWjCwFgIRbzobfLahqYN8u0qhW0im92txkssXFVRMyuQwTuDkWGENkAGOii9YtczbPinS
	38/7xJMEGwpBPRWFAj4O+BCXxDu1J70=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-5cm9xkFsNk-ods-EWc3kXg-1; Tue, 12 May 2020 16:46:31 -0400
X-MC-Unique: 5cm9xkFsNk-ods-EWc3kXg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F730460;
	Tue, 12 May 2020 20:46:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60B7F63F8F;
	Tue, 12 May 2020 20:46:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 05B7D1809543;
	Tue, 12 May 2020 20:46:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04CKkBEo019178 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 12 May 2020 16:46:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BCB8B2156A3D; Tue, 12 May 2020 20:46:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B87A92156A49
	for <dm-devel@redhat.com>; Tue, 12 May 2020 20:46:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA1B1801009
	for <dm-devel@redhat.com>; Tue, 12 May 2020 20:46:09 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-295-PTi4ogQUPCW2OoxtHa_m1Q-1;
	Tue, 12 May 2020 16:46:02 -0400
X-MC-Unique: PTi4ogQUPCW2OoxtHa_m1Q-1
Received: from [10.137.106.115] (unknown [131.107.174.243])
	by linux.microsoft.com (Postfix) with ESMTPSA id 8F07520B717B;
	Tue, 12 May 2020 13:46:00 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8F07520B717B
From: Deven Bowers <deven.desai@linux.microsoft.com>
To: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>, agk@redhat.com,
	axboe@kernel.dk, snitzer@redhat.com, jmorris@namei.org,
	serge@hallyn.com, zohar@linux.ibm.com, linux-integrity@vger.kernel.org, 
	linux-security-module@vger.kernel.org, dm-devel@redhat.com,
	linux-block@vger.kernel.org, jannh@google.com
References: <20200415162550.2324-1-deven.desai@linux.microsoft.com>
	<b07ac7e1-7cf5-92c9-81d0-64174c3d5024@digikod.net>
	<0001755a-6b2a-b13b-960c-eb0b065c8e3c@linux.microsoft.com>
Message-ID: <8ba7b15f-de91-40f7-fc95-115228345fce@linux.microsoft.com>
Date: Tue, 12 May 2020 13:46:00 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <0001755a-6b2a-b13b-960c-eb0b065c8e3c@linux.microsoft.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04CKkBEo019178
X-loop: dm-devel@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"; Format="flowed"
Content-Transfer-Encoding: quoted-printable



On 5/11/2020 11:03 AM, Deven Bowers wrote:
>=20
>=20
> On 5/10/2020 2:28 AM, Micka=EBl Sala=FCn wrote:
>=20
> [...snip]
>=20
>>>
>>> Additionally, rules are evaluated top-to-bottom. As a result, any
>>> revocation rules, or denies should be placed early in the file to ensur=
e
>>> that these rules are evaluated before a rule with "action=3DALLOW" is h=
it.
>>>
>>> IPE policy is designed to be forward compatible and backwards=20
>>> compatible,
>>> thus any failure to parse a rule will result in the line being ignored,
>>> and a warning being emitted. If backwards compatibility is not required=
,
>>> the kernel commandline parameter and sysctl, ipe.strict_parse can be
>>> enabled, which will cause these warnings to be fatal.
>>
>> Ignoring unknown command may lead to inconsistent beaviors. To achieve
>> forward compatibility, I think it would be better to never ignore
>> unknown rule but to give a way to userspace to known what is the current
>> kernel ABI. This could be done with a securityfs file listing the
>> current policy grammar.
>>
>=20
> That's a fair point. From a manual perspective, I think this is fine.
> A human-user can interpret a grammar successfully on their own when new
> syntax is introduced.
>=20
>  From a producing API perspective, I'd have to think about it a bit=20
> more. Ideally, the grammar would be structured in such a way that the=20
> userland
> interpreter of this grammar would not have to be updated once new syntax
> is introduced, avoiding the need to update the userland binary. To do so
> generically ("op=3D%s") is easy, but doesn't necessarily convey sufficien=
t
> information (what happens when a new "op" token is introduced?). I think
> this may come down to regular expression representations of valid values
> for these tokens, which worries me as regular expressions are incredibly
> error-prone[1].
>=20
> I'll see what I can come up with regarding this.

I have not found a way that I like to expose some kind of grammar
through securityfs that can be understood by usermode to parse the
policy. Here's what I propose as a compromise:

=091. I remove the unknown command behavior. This address your
first point about inconsistent behaviors, and effectively removes the
strict_parse sysctl (as it is always enabled).

=092. I introduce a versioning system for the properties
themselves. The valid set of properties and their versions
can be found in securityfs, under say, ipe/config in a key=3Dvalue
format where `key` indicates the understood token, and `value`
indicates their current version. For example:

=09$ cat $SECURITYFS/ipe/config
=09op=3D1
=09action=3D1
=09policy_name=3D1
=09policy_version=3D1
=09dmverity_signature=3D1
=09dmverity_roothash=3D1
=09boot_verified=3D1

if new syntax is introduced, the version number is increased.

=093. The format of those versions are documented as part of
the admin-guide around IPE. If user-mode at that point wants to rip
the documentation formats and correlate with the versioning, then
it fulfills the same functionality as above, with out the complexity
around exposing a parsing grammar and interpreting it on-the-fly.
Many of these are unlikely to move past version 1, however.

Thoughts?


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

