Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6221E5A90A
	for <lists+dm-devel@lfdr.de>; Sat, 29 Jun 2019 06:28:48 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6518F99C1D;
	Sat, 29 Jun 2019 04:28:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B45201001B05;
	Sat, 29 Jun 2019 04:28:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5FD9F1806B0F;
	Sat, 29 Jun 2019 04:28:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5T4PRi7007731 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 29 Jun 2019 00:25:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C59926013A; Sat, 29 Jun 2019 04:25:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 87BAF600C6;
	Sat, 29 Jun 2019 04:25:23 +0000 (UTC)
Received: from namei.org (namei.org [65.99.196.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DB16A30C1CA2;
	Sat, 29 Jun 2019 04:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by namei.org (8.14.4/8.14.4) with ESMTP id x5T41PhZ017591;
	Sat, 29 Jun 2019 04:01:25 GMT
Date: Fri, 28 Jun 2019 21:01:25 -0700 (PDT)
From: James Morris <jmorris@namei.org>
To: Eric Biggers <ebiggers@kernel.org>
In-Reply-To: <20190628040041.GB673@sol.localdomain>
Message-ID: <alpine.LRH.2.21.1906282040490.15624@namei.org>
References: <20190619191048.20365-1-jaskarankhurana@linux.microsoft.com>
	<20190628040041.GB673@sol.localdomain>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Delayed for 00:23:45 by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.46]); Sat, 29 Jun 2019 04:25:19 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Sat, 29 Jun 2019 04:25:19 +0000 (UTC) for IP:'65.99.196.166'
	DOMAIN:'namei.org' HELO:'namei.org' FROM:'jmorris@namei.org'
	RCPT:''
X-RedHat-Spam-Score: 0.002  (SPF_HELO_NONE,
	SPF_NONE) 65.99.196.166 namei.org 65.99.196.166 namei.org
	<jmorris@namei.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: scottsh@microsoft.com, dm-devel@redhat.com, snitzer@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org, mpatocka@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-integrity@vger.kernel.org,
	gmazyland@gmail.com, agk@redhat.com,
	Jaskaran Khurana <jaskarankhurana@linux.microsoft.com>
Subject: Re: [dm-devel] [RFC PATCH v5 0/1] Add dm verity root hash pkcs7 sig
 validation.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Sat, 29 Jun 2019 04:28:46 +0000 (UTC)

On Thu, 27 Jun 2019, Eric Biggers wrote:

> I don't understand your justification for this feature.
> 
> If userspace has already been pwned severely enough for the attacker to be
> executing arbitrary code with CAP_SYS_ADMIN (which is what the device mapper
> ioctls need), what good are restrictions on loading more binaries from disk?
> 
> Please explain your security model.

Let's say the system has a policy where all code must be signed with a 
valid key, and that one mechanism for enforcing this is via signed 
dm-verity volumes. Validating the signature within the kernel provides 
stronger assurance than userspace validation. The kernel validates and 
executes the code, using kernel-resident keys, and does not need to rely 
on validation which has occurred across a trust boundary.

You don't need arbitrary CAP_SYS_ADMIN code execution, you just need a 
flaw in the app (or its dependent libraries, or configuration) which 
allows signature validation to be bypassed.

The attacker now needs a kernel rather than a userspace vulnerability to 
bypass the signed code policy.

-- 
James Morris
<jmorris@namei.org>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
