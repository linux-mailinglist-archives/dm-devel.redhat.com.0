Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 570691CE239
	for <lists+dm-devel@lfdr.de>; Mon, 11 May 2020 20:04:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589220261;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5TQ5SuT7SRLAbmisGvFYlGTIYkjRvqHmfKRl5ubMm9M=;
	b=dCGEROW6yRUQsvf3+yWuGR8kNRt/Z9Ytj04YBwa78RmXncY3c6M3Lgg9+hZWYrulTXYl0r
	mnwgd446jDe2JYLC1bQUnTh9usxCB3+Nz00JoY11ImDh5GAcP/zImyVwo05yipeYWDiurT
	04zznLQl5MJk8n4cgb3r0Bb0P1qkt38=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-aDmg0ih-M0u6CJW9vDxjcw-1; Mon, 11 May 2020 14:04:18 -0400
X-MC-Unique: aDmg0ih-M0u6CJW9vDxjcw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78944107ACF7;
	Mon, 11 May 2020 18:04:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EBB825D9E7;
	Mon, 11 May 2020 18:04:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 473AE1809543;
	Mon, 11 May 2020 18:03:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04BI3jnM022233 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 14:03:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2C4E8113F76; Mon, 11 May 2020 18:03:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 276A610F994
	for <dm-devel@redhat.com>; Mon, 11 May 2020 18:03:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A6461019CAA
	for <dm-devel@redhat.com>; Mon, 11 May 2020 18:03:42 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-394-WAJDQ-SBND6ETbLOUT8CZA-1;
	Mon, 11 May 2020 14:03:33 -0400
X-MC-Unique: WAJDQ-SBND6ETbLOUT8CZA-1
Received: from [10.137.106.115] (unknown [131.107.174.243])
	by linux.microsoft.com (Postfix) with ESMTPSA id A459320B717B;
	Mon, 11 May 2020 11:03:31 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A459320B717B
To: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>, agk@redhat.com,
	axboe@kernel.dk, snitzer@redhat.com, jmorris@namei.org,
	serge@hallyn.com, zohar@linux.ibm.com, linux-integrity@vger.kernel.org, 
	linux-security-module@vger.kernel.org, dm-devel@redhat.com,
	linux-block@vger.kernel.org, jannh@google.com
References: <20200415162550.2324-1-deven.desai@linux.microsoft.com>
	<b07ac7e1-7cf5-92c9-81d0-64174c3d5024@digikod.net>
From: Deven Bowers <deven.desai@linux.microsoft.com>
Message-ID: <0001755a-6b2a-b13b-960c-eb0b065c8e3c@linux.microsoft.com>
Date: Mon, 11 May 2020 11:03:31 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <b07ac7e1-7cf5-92c9-81d0-64174c3d5024@digikod.net>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04BI3jnM022233
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"; Format="flowed"
Content-Transfer-Encoding: quoted-printable



On 5/10/2020 2:28 AM, Micka=EBl Sala=FCn wrote:

[...snip]

>>
>> Additionally, rules are evaluated top-to-bottom. As a result, any
>> revocation rules, or denies should be placed early in the file to ensure
>> that these rules are evaluated before a rule with "action=3DALLOW" is hi=
t.
>>
>> IPE policy is designed to be forward compatible and backwards compatible=
,
>> thus any failure to parse a rule will result in the line being ignored,
>> and a warning being emitted. If backwards compatibility is not required,
>> the kernel commandline parameter and sysctl, ipe.strict_parse can be
>> enabled, which will cause these warnings to be fatal.
>=20
> Ignoring unknown command may lead to inconsistent beaviors. To achieve
> forward compatibility, I think it would be better to never ignore
> unknown rule but to give a way to userspace to known what is the current
> kernel ABI. This could be done with a securityfs file listing the
> current policy grammar.
>=20

That's a fair point. From a manual perspective, I think this is fine.
A human-user can interpret a grammar successfully on their own when new
syntax is introduced.

 From a producing API perspective, I'd have to think about it a bit=20
more. Ideally, the grammar would be structured in such a way that the=20
userland
interpreter of this grammar would not have to be updated once new syntax
is introduced, avoiding the need to update the userland binary. To do so
generically ("op=3D%s") is easy, but doesn't necessarily convey sufficient
information (what happens when a new "op" token is introduced?). I think
this may come down to regular expression representations of valid values
for these tokens, which worries me as regular expressions are incredibly
error-prone[1].

I'll see what I can come up with regarding this.


[1]=20
https://blog.cloudflare.com/details-of-the-cloudflare-outage-on-july-2-2019=
/


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

