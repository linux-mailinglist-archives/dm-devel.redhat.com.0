Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E2C123B966F
	for <lists+dm-devel@lfdr.de>; Thu,  1 Jul 2021 21:20:53 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-Z2fnh8OTM_awIpPWXDIQ9g-1; Thu, 01 Jul 2021 15:20:51 -0400
X-MC-Unique: Z2fnh8OTM_awIpPWXDIQ9g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADA2F8030D7;
	Thu,  1 Jul 2021 19:20:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D95105D6AB;
	Thu,  1 Jul 2021 19:20:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C6E054EA2A;
	Thu,  1 Jul 2021 19:20:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 161JKDO8002920 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 1 Jul 2021 15:20:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BF0D8208DDBB; Thu,  1 Jul 2021 19:20:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B71342094D17
	for <dm-devel@redhat.com>; Thu,  1 Jul 2021 19:20:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2323F1064E70
	for <dm-devel@redhat.com>; Thu,  1 Jul 2021 19:20:11 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-126-PEmCHG8wMTqPpPzlSkHuRQ-1;
	Thu, 01 Jul 2021 15:20:06 -0400
X-MC-Unique: PEmCHG8wMTqPpPzlSkHuRQ-1
Received: by mail.kernel.org (Postfix) with ESMTPS id D4840613EC;
	Thu,  1 Jul 2021 19:20:04 +0000 (UTC)
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
	[127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id
	BE1A6609B2; Thu,  1 Jul 2021 19:20:04 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <YNyparaGoPleiSxX@redhat.com>
References: <YNyparaGoPleiSxX@redhat.com>
X-PR-Tracked-List-Id: device-mapper development <dm-devel.redhat.com>
X-PR-Tracked-Message-Id: <YNyparaGoPleiSxX@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git
	tags/for-5.14/dm-changes
X-PR-Tracked-Commit-Id: 5c0de3d72f8c05678ed769bea24e98128f7ab570
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2cfa582be80081fb8db02d4d9b44bff34b82ac54
Message-Id: <162516720470.9429.1516660542564400927.pr-tracker-bot@kernel.org>
Date: Thu, 01 Jul 2021 19:20:04 +0000
To: Mike Snitzer <snitzer@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Damien Le Moal <damien.lemoal@wdc.com>, dm-devel@redhat.com,
	Rikard Falkeborn <rikard.falkeborn@gmail.com>,
	Colin Ian King <colin.king@canonical.com>,
	linux-block@vger.kernel.org, Joe Thornber <ejt@redhat.com>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Hou Tao <houtao1@huawei.com>, Baokun Li <libaokun1@huawei.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Alasdair G Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [git pull] device mapper changes for 5.14
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The pull request you sent on Wed, 30 Jun 2021 13:27:06 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.14/dm-changes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2cfa582be80081fb8db02d4d9b44bff34b82ac54

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

