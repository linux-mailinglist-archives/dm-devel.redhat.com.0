Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 652363C457
	for <lists+dm-devel@lfdr.de>; Tue, 11 Jun 2019 08:37:02 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 16FEF3082129;
	Tue, 11 Jun 2019 06:36:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4080B608E4;
	Tue, 11 Jun 2019 06:36:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 671881833002;
	Tue, 11 Jun 2019 06:36:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5B6ZjY8017902 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 11 Jun 2019 02:35:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BD46760C4E; Tue, 11 Jun 2019 06:35:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 675B960BF1;
	Tue, 11 Jun 2019 06:35:40 +0000 (UTC)
Received: from namei.org (namei.org [65.99.196.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D14CD30833A0;
	Tue, 11 Jun 2019 06:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by namei.org (8.14.4/8.14.4) with ESMTP id x5B5VjUm008646;
	Tue, 11 Jun 2019 05:31:45 GMT
Date: Tue, 11 Jun 2019 15:31:45 +1000 (AEST)
From: James Morris <jmorris@namei.org>
To: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <54170d18-31c7-463d-10b5-9af8b666df0f@gmail.com>
Message-ID: <alpine.LRH.2.21.1906111524060.8305@namei.org>
References: <20190607223140.16979-1-jaskarankhurana@linux.microsoft.com>
	<20190607223140.16979-2-jaskarankhurana@linux.microsoft.com>
	<54170d18-31c7-463d-10b5-9af8b666df0f@gmail.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Delayed for 01:03:17 by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.44]); Tue, 11 Jun 2019 06:35:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Tue, 11 Jun 2019 06:35:27 +0000 (UTC) for IP:'65.99.196.166'
	DOMAIN:'namei.org' HELO:'namei.org' FROM:'jmorris@namei.org'
	RCPT:''
X-RedHat-Spam-Score: 0.002  (SPF_HELO_NONE,
	SPF_NONE) 65.99.196.166 namei.org 65.99.196.166 namei.org
	<jmorris@namei.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: scottsh@microsoft.com, dm-devel@redhat.com, snitzer@redhat.com,
	ebiggers@google.com, linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Mikulas Patocka <mpatocka@redhat.com>,
	linux-fsdevel@vger.kernel.org, linux-integrity@vger.kernel.org,
	agk@redhat.com, Jaskaran Khurana <jaskarankhurana@linux.microsoft.com>
Subject: Re: [dm-devel] [RFC PATCH v3 1/1] Add dm verity root hash pkcs7 sig
 validation
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Tue, 11 Jun 2019 06:37:00 +0000 (UTC)

On Sat, 8 Jun 2019, Milan Broz wrote:

> > Adds DM_VERITY_VERIFY_ROOTHASH_SIG_FORCE: roothash signature *must* be
> > specified for all dm verity volumes and verification must succeed prior
> > to creation of device mapper block device.
> 
> AFAIK there are tools that use dm-verity internally (some container
> functions in systemd can recognize and check dm-verity partitions) and with
> this option we will just kill possibility to use it without signature.
> 
> Anyway, this is up to Mike and Mikulas, I guess generic distros will not
> set this option.

Right, I think this option would not be for a general purpose distro, but 
for embedded systems and other cases where the user may want a more 
tightly locked-down system.

-- 
James Morris
<jmorris@namei.org>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
