Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 24C972CF65C
	for <lists+dm-devel@lfdr.de>; Fri,  4 Dec 2020 22:44:26 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-TRnq2mwpNYez9h2_Ae-QfA-1; Fri, 04 Dec 2020 16:44:22 -0500
X-MC-Unique: TRnq2mwpNYez9h2_Ae-QfA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15E0010054FF;
	Fri,  4 Dec 2020 21:44:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 032CB1349A;
	Fri,  4 Dec 2020 21:44:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BAA8B180954D;
	Fri,  4 Dec 2020 21:44:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B4LhuRs009373 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 4 Dec 2020 16:43:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 056152166B2B; Fri,  4 Dec 2020 21:43:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 005E22166B27
	for <dm-devel@redhat.com>; Fri,  4 Dec 2020 21:43:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86743800B3A
	for <dm-devel@redhat.com>; Fri,  4 Dec 2020 21:43:51 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-79-NFHD4mmXNLqF1D-zJAYjTQ-1; 
	Fri, 04 Dec 2020 16:43:47 -0500
X-MC-Unique: NFHD4mmXNLqF1D-zJAYjTQ-1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20201204210521.GA3937@redhat.com>
References: <20201204210521.GA3937@redhat.com>
X-PR-Tracked-List-Id: <linux-block.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201204210521.GA3937@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git
	tags/for-5.10/dm-fixes
X-PR-Tracked-Commit-Id: bde3808bc8c2741ad3d804f84720409aee0c2972
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b3298500b23f0b53a8d81e0d5ad98a29db71f4f0
Message-Id: <160711773655.16738.13830016046956700847.pr-tracker-bot@kernel.org>
Date: Fri, 04 Dec 2020 21:35:36 +0000
To: Mike Snitzer <snitzer@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, Nick Desaulniers <ndesaulniers@google.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>, vgoyal@redhat.com,
	Sergei Shtepa <sergei.shtepa@veeam.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Alasdair G Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [git pull] device mapper fixes for 5.10-rc7
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The pull request you sent on Fri, 4 Dec 2020 16:05:21 -0500:

> git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.10/dm-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b3298500b23f0b53a8d81e0d5ad98a29db71f4f0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

