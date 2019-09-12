Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BFDB0A8E
	for <lists+dm-devel@lfdr.de>; Thu, 12 Sep 2019 10:46:32 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 01CB818C892A;
	Thu, 12 Sep 2019 08:46:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 613AC1001B07;
	Thu, 12 Sep 2019 08:46:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D9DDD2551B;
	Thu, 12 Sep 2019 08:46:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8C8jraJ027286 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 12 Sep 2019 04:45:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CBD0F5C25B; Thu, 12 Sep 2019 08:45:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (unknown [10.40.205.79])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F33035C22C;
	Thu, 12 Sep 2019 08:45:50 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.92)
	(envelope-from <mpatocka@redhat.com>)
	id 1i8Kjc-00035R-9Z; Thu, 12 Sep 2019 10:45:49 +0200
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Thu, 12 Sep 2019 10:45:44 +0200
Message-Id: <20190912084443.142319800@debian-a64.vm>
User-Agent: quilt/0.65
Date: Thu, 12 Sep 2019 10:44:43 +0200
From: Mikulas Patocka <mpatocka@redhat.com>
To: Martijn Coenen <maco@android.com>, Mike Snitzer <msnitzer@redhat.com>,
	Alasdair G Kergon <agk@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: maco@google.com, dm-devel@redhat.com, jiyong@google.com,
	kernel-team@android.com, dariofreni@google.com
Subject: [dm-devel] [PATCH 0/5] use global replacement for dm-bufio buffers
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]); Thu, 12 Sep 2019 08:46:30 +0000 (UTC)

dm-bufio divides the size of cache by the number of clients and uses it as
a per-client limit. However, this is suboptimal when there is large amount
of clients.

This patch set introduces global buffer replacement. All the buffers from
all the clients are put to a global queue and dm-bufio cleans up old
buffers in the queue.

This improves cache utilization - if one dm-bufio client uses the cache
heavily and another dm-bufio client is not using the cache, dm-bufio will
prefer caching buffers from the first client (instead of partitioning the
cache equally between the first and second client).

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
