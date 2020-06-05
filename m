Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 5CED81F03EA
	for <lists+dm-devel@lfdr.de>; Sat,  6 Jun 2020 02:24:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591403084;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7lPj2YE4vUQYB0T1WXwVIb9CdweXZOngmMe5CS9gdu4=;
	b=fX1T+rAbJc+c/v9H2ZMde/9NXFBTKNsMJAJBpDt7NbIqVxJ7wct1DnrD4RVNdrqn57AsO/
	j57udanO2I8WdnW76bOtCtrp+IHm1aaJR0WTLQKEL0OCV41MiW6DGsUVzTi3eLo9Sby99J
	6KDw/s8BSuLM668AceKOjTzKLi8tkI8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-5AHozhidPA-l9xaiyLP0xA-1; Fri, 05 Jun 2020 20:24:42 -0400
X-MC-Unique: 5AHozhidPA-l9xaiyLP0xA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB64D81CBF5;
	Sat,  6 Jun 2020 00:24:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC4D45D9C5;
	Sat,  6 Jun 2020 00:24:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5312CD32D7;
	Sat,  6 Jun 2020 00:24:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 055NPNaG020183 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 5 Jun 2020 19:25:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8DAF710054E8; Fri,  5 Jun 2020 23:25:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 897471006E28
	for <dm-devel@redhat.com>; Fri,  5 Jun 2020 23:25:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3002185A78B
	for <dm-devel@redhat.com>; Fri,  5 Jun 2020 23:25:20 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-471-i3AVDAKqN0KuiEviPYk7vw-1;
	Fri, 05 Jun 2020 19:25:15 -0400
X-MC-Unique: i3AVDAKqN0KuiEviPYk7vw-1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200605191613.GA621@redhat.com>
References: <20200605145124.GA31972@redhat.com>
	<20200605191613.GA621@redhat.com>
X-PR-Tracked-List-Id: <linux-block.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200605191613.GA621@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git
	tags/for-5.8/dm-changes
X-PR-Tracked-Commit-Id: 64611a15ca9da91ff532982429c44686f4593b5f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b25c6644bfd3affd7d0127ce95c5c96c155a7515
Message-Id: <159139891929.4436.16769068315334032119.pr-tracker-bot@kernel.org>
Date: Fri, 05 Jun 2020 23:15:19 +0000
To: Mike Snitzer <gustavoars@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Dmitry Baryshkov <dmitry_baryshkov@mentor.com>,
	Eric Biggers <ebiggers@google.com>,
	Gabriel Krisman Bertazi <krisman@collabora.com>,
	YueHaibing <yuehaibing@huawei.com>, Khazhismel Kumykov <khazhy@google.com>,
	Zhiqiang Liu <liuzhiqiang26@huawei.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>,
	Heinz Mauelshagen <heinzm@redhat.com>,
	Nathan Chancellor <natechancellor@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Martin Wilck <mwilck@suse.com>, Alasdair G Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [git pull v2] device mapper changes for 5.8
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The pull request you sent on Fri, 5 Jun 2020 15:16:13 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.8/dm-changes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b25c6644bfd3affd7d0127ce95c5c96c155a7515

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

