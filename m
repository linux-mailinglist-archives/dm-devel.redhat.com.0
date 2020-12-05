Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4C2402CFE43
	for <lists+dm-devel@lfdr.de>; Sat,  5 Dec 2020 20:22:44 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-8pej5Fh_MeayZtPCXmv8Ow-1; Sat, 05 Dec 2020 14:22:40 -0500
X-MC-Unique: 8pej5Fh_MeayZtPCXmv8Ow-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1693188C903;
	Sat,  5 Dec 2020 19:22:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D85DB5D9DB;
	Sat,  5 Dec 2020 19:22:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1A696180954D;
	Sat,  5 Dec 2020 19:22:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B5JLiDH027205 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 5 Dec 2020 14:21:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BE11C5D20C; Sat,  5 Dec 2020 19:21:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B852F5D229
	for <dm-devel@redhat.com>; Sat,  5 Dec 2020 19:21:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F3E7100B164
	for <dm-devel@redhat.com>; Sat,  5 Dec 2020 19:21:42 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-581-ZeH8EOKLM5WNSUxecqB0pQ-1;
	Sat, 05 Dec 2020 14:21:40 -0500
X-MC-Unique: ZeH8EOKLM5WNSUxecqB0pQ-1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20201204231225.GA4574@redhat.com>
References: <20201204210521.GA3937@redhat.com>
	<160711773655.16738.13830016046956700847.pr-tracker-bot@kernel.org>
	<20201204223742.GA82260@lobo> <20201204231225.GA4574@redhat.com>
X-PR-Tracked-List-Id: device-mapper development <dm-devel.redhat.com>
X-PR-Tracked-Message-Id: <20201204231225.GA4574@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git
	tags/for-5.10/dm-fixes-2
X-PR-Tracked-Commit-Id: 65f33b35722952fa076811d5686bfd8a611a80fa
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8762340561397fce0f0b41220ed9619101c870d0
Message-Id: <160719609911.18711.171386792638793811.pr-tracker-bot@kernel.org>
Date: Sat, 05 Dec 2020 19:21:39 +0000
To: Mike Snitzer <snitzer@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, axboe@kernel.dk, dm-devel@redhat.com,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [dm-devel] [git pull] device mapper induced block fix for
	5.10-rc7
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The pull request you sent on Fri, 4 Dec 2020 18:12:26 -0500:

> git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.10/dm-fixes-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8762340561397fce0f0b41220ed9619101c870d0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

