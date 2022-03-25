Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B45914E6CAF
	for <lists+dm-devel@lfdr.de>; Fri, 25 Mar 2022 03:55:23 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-tJjvnYOEOH-RTe9--FYphw-1; Thu, 24 Mar 2022 22:55:19 -0400
X-MC-Unique: tJjvnYOEOH-RTe9--FYphw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 129863C11C6C;
	Fri, 25 Mar 2022 02:55:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 84AF61457F04;
	Fri, 25 Mar 2022 02:55:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 79026194035D;
	Fri, 25 Mar 2022 02:55:06 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 29D071940341
 for <dm-devel@listman.corp.redhat.com>; Fri, 25 Mar 2022 02:55:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EBE95401E91; Fri, 25 Mar 2022 02:55:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E7E95401E8C
 for <dm-devel@redhat.com>; Fri, 25 Mar 2022 02:55:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF5DB1011607
 for <dm-devel@redhat.com>; Fri, 25 Mar 2022 02:55:04 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-wtxoXZCYMQ-QOIssBVkKNg-1; Thu, 24 Mar 2022 22:55:01 -0400
X-MC-Unique: wtxoXZCYMQ-QOIssBVkKNg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id D5E3BCE28B1;
 Fri, 25 Mar 2022 02:47:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4CF1DC340EC;
 Fri, 25 Mar 2022 02:47:10 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 3A303E6D44B; Fri, 25 Mar 2022 02:47:10 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <YjuFWbp0vdh/7c5A@redhat.com>
References: <YjuFWbp0vdh/7c5A@redhat.com>
X-PR-Tracked-List-Id: device-mapper development <dm-devel.redhat.com>
X-PR-Tracked-Message-Id: <YjuFWbp0vdh/7c5A@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git
 tags/for-5.18/dm-changes
X-PR-Tracked-Commit-Id: 4d7bca13dd9a5033174b0735056c5658cb893e76
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b1f8ccdaae0310332d16f65bf0f622f9d4ae2391
Message-Id: <164817643023.17034.838620470975420781.pr-tracker-bot@kernel.org>
Date: Fri, 25 Mar 2022 02:47:10 +0000
To: Mike Snitzer <snitzer@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [dm-devel] [git pull] device mapper changes for 5.18
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Aashish Sharma <shraash@google.com>, linux-block@vger.kernel.org,
 Jordy Zomer <jordy@jordyzomer.github.io>, Tom Rix <trix@redhat.com>,
 Barry Song <21cnbao@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Ming Lei <ming.lei@redhat.com>, Wang Qing <wangqing@vivo.com>,
 dm-devel@redhat.com, Kirill Tkhai <ktkhai@virtuozzo.com>,
 Alasdair G Kergon <agk@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Zhiqiang Liu <liuzhiqiang26@huawei.com>,
 Colin Ian King <colin.i.king@gmail.com>, Thore Sommer <public@thson.de>
MIME-Version: 1.0
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The pull request you sent on Wed, 23 Mar 2022 16:38:49 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.18/dm-changes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b1f8ccdaae0310332d16f65bf0f622f9d4ae2391

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

