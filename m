Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id D2FB120C2F4
	for <lists+dm-devel@lfdr.de>; Sat, 27 Jun 2020 18:06:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593273981;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Jeam/tJAgIW8NXv+t+vvVA3y0ScMc3atL6qP72vKJhc=;
	b=h01nOQ9z3tg05AmQAg4x8vJ0QWuv349bYMHApnAd4kLyNmTw9FangBUvylOI6K7NIVO/qR
	RUnTZulqoIVrjNlnsUX05ssiotp946KkcUep0X3CgyPDKLpN/5LOxNq1PxQR+/a8/kGdHs
	bhYYeIh18ucKK3k1EqIc+6f/gKS/Q8M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-2z8NL_2jMiqlMIlylke4jA-1; Sat, 27 Jun 2020 12:06:19 -0400
X-MC-Unique: 2z8NL_2jMiqlMIlylke4jA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BADEE802ED6;
	Sat, 27 Jun 2020 16:06:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE0C9121A58;
	Sat, 27 Jun 2020 16:06:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 04900833DC;
	Sat, 27 Jun 2020 16:05:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05RG5e0P023579 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 27 Jun 2020 12:05:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BC6662156A4F; Sat, 27 Jun 2020 16:05:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 995AA2156A4C
	for <dm-devel@redhat.com>; Sat, 27 Jun 2020 16:05:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9605A8007C8
	for <dm-devel@redhat.com>; Sat, 27 Jun 2020 16:05:35 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-393-RssEX5HWMmKM3nck6-vFvQ-1;
	Sat, 27 Jun 2020 12:05:32 -0400
X-MC-Unique: RssEX5HWMmKM3nck6-vFvQ-1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200626192847.GA11459@redhat.com>
References: <20200626192847.GA11459@redhat.com>
X-PR-Tracked-List-Id: <linux-block.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200626192847.GA11459@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git
	tags/for-5.8/dm-fixes
X-PR-Tracked-Commit-Id: d35bd764e6899a7bea71958f08d16cea5bfa1919
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5e8eed279f280d6ad4cf59b3330d5d6d7b9de733
Message-Id: <159327391366.13835.5012151205727257026.pr-tracker-bot@kernel.org>
Date: Sat, 27 Jun 2020 16:05:13 +0000
To: Mike Snitzer <snitzer@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Damien Le Moal <damien.lemoal@wdc.com>, Huaisheng Ye <yehs1@lenovo.com>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>, Hou Tao <houtao1@huawei.com>,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Alasdair G Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [git pull] device mapper fixes for 5.8-rc3
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The pull request you sent on Fri, 26 Jun 2020 15:28:47 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.8/dm-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5e8eed279f280d6ad4cf59b3330d5d6d7b9de733

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

