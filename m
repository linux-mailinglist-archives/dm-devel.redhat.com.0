Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D4E58CAC4
	for <lists+dm-devel@lfdr.de>; Mon,  8 Aug 2022 16:50:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659970253;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=b0yl3YOijP0jbrwYyhg1LCPC48+yrj+zpgfXGgz2rB8=;
	b=UCJbH3s+b2GrZMbA8s0hMl1kaiQBFp271D4qK/dDGIbeB5n36eczKerL//eM8+b7FLJf9G
	WvKWBzM9lr4TZ8kIOU1PcRnj0qKsQ25xHp/th1sVuP5Z1xLjxiq3BaMky07GRv+nOricOS
	yqsxSxr1viBEeZbcbpA6VmhNITQd3BA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-3BmMAE7DOKiXrVoOB7DvYA-1; Mon, 08 Aug 2022 10:50:52 -0400
X-MC-Unique: 3BmMAE7DOKiXrVoOB7DvYA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E640618A6537;
	Mon,  8 Aug 2022 14:50:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 80951400E403;
	Mon,  8 Aug 2022 14:50:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CCE1C1946A64;
	Mon,  8 Aug 2022 14:50:16 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3087E1946A49
 for <dm-devel@listman.corp.redhat.com>; Mon,  8 Aug 2022 14:50:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E40209458A; Mon,  8 Aug 2022 14:50:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BAD2E18ECC;
 Mon,  8 Aug 2022 14:50:13 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 278EoDG2013274; Mon, 8 Aug 2022 10:50:13 -0400
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 278EoAkb013269; Mon, 8 Aug 2022 10:50:12 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Mon, 8 Aug 2022 10:50:10 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Mike Snitzer <snitzer@kernel.org>, dm-devel@redhat.com
In-Reply-To: <202208050301.roHRxc6O-lkp@intel.com>
Message-ID: <alpine.LRH.2.02.2208081034050.8160@file01.intranet.prod.int.rdu2.redhat.com>
References: <202208050301.roHRxc6O-lkp@intel.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [dm-devel] [PATCH] dm-writecache: drop the lock on an 'impossible'
 path
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
Cc: kbuild@lists.01.org, kbuild-all@lists.01.org, lkp@intel.com,
 Mike Snitzer <snitzer@redhat.com>, linux-kernel@vger.kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Fri, 5 Aug 2022, Dan Carpenter wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   b44f2fd87919b5ae6e1756d4c7ba2cbba22238e1
> commit: df699cc16ea5ef93a917676dcdd4376e02860ad5 dm writecache: report invalid return from writecache_map helpers
> config: arc-randconfig-m041-20220804 (https://download.01.org/0day-ci/archive/20220805/202208050301.roHRxc6O-lkp@intel.com/config)
> compiler: arc-elf-gcc (GCC) 12.1.0
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> smatch warnings:
> drivers/md/dm-writecache.c:1554 writecache_map() warn: inconsistent returns '&wc->lock'.

Hi

Here I'm sending a patch for this warning.

Mikulas



From: Mikulas Patocka <mpatocka@redhat.com>

There's a smatch warning "inconsistent returns '&wc->lock'" in
dm-writecache. The reason for the warning is that the function
writecache_map doesn't drop the lock on the impossible path. This patch
adds wc_unlock after the BUG statement (so that it will be compiled-away
anyway) to fix the warning.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

Index: linux-2.6/drivers/md/dm-writecache.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-writecache.c
+++ linux-2.6/drivers/md/dm-writecache.c
@@ -1598,7 +1598,8 @@ done:
 
 	default:
 		BUG();
-		return -1;
+		wc_unlock(wc);
+		return DM_MAPIO_KILL;
 	}
 }
 
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

