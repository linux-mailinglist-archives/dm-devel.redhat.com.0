Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6166E2E1017
	for <lists+dm-devel@lfdr.de>; Tue, 22 Dec 2020 23:24:48 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-GxIae1QkM9q2QLxrfEpHWw-1; Tue, 22 Dec 2020 17:24:45 -0500
X-MC-Unique: GxIae1QkM9q2QLxrfEpHWw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 717BD10054FF;
	Tue, 22 Dec 2020 22:24:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 840EA5F9A7;
	Tue, 22 Dec 2020 22:24:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D2DCF4A7C6;
	Tue, 22 Dec 2020 22:24:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BMMOGxf009260 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 22 Dec 2020 17:24:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1FEE02026D49; Tue, 22 Dec 2020 22:24:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B0B92026D3B
	for <dm-devel@redhat.com>; Tue, 22 Dec 2020 22:24:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49799101A53F
	for <dm-devel@redhat.com>; Tue, 22 Dec 2020 22:24:12 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-399-EhCOPsfRNkmKtyPaEBPjkg-1;
	Tue, 22 Dec 2020 17:24:08 -0500
X-MC-Unique: EhCOPsfRNkmKtyPaEBPjkg-1
Received: by mail.kernel.org (Postfix) with ESMTPS id 4843422AAF;
	Tue, 22 Dec 2020 22:24:07 +0000 (UTC)
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain
	[127.0.0.1])
	by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id
	4210460113; Tue, 22 Dec 2020 22:24:07 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <20201222151823.GA17999@redhat.com>
References: <20201222151823.GA17999@redhat.com>
X-PR-Tracked-List-Id: <linux-block.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201222151823.GA17999@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git
	tags/for-5.11/dm-changes
X-PR-Tracked-Commit-Id: b77709237e72d6467fb27bfbad163f7221ecd648
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d8355e740f419a081796e869bafdfc0756b0bf2a
Message-Id: <160867584726.8550.13161305291113777694.pr-tracker-bot@kernel.org>
Date: Tue, 22 Dec 2020 22:24:07 +0000
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
Cc: Rikard Falkeborn <rikard.falkeborn@gmail.com>,
	Antonio Quartulli <a@unstable.cc>, Qinglang Miao <miaoqinglang@huawei.com>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@linux.microsoft.com>,
	linux-block@vger.kernel.org,
	Zheng Yongjun <zhengyongjun3@huawei.com>, dm-devel@redhat.com,
	Mike Christie <michael.christie@oracle.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Hyeongseok Kim <hyeongseok@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Alasdair G Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [git pull] device mapper changes for 5.11
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The pull request you sent on Tue, 22 Dec 2020 10:18:24 -0500:

> git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.11/dm-changes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d8355e740f419a081796e869bafdfc0756b0bf2a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

