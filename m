Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 48B7E214330
	for <lists+dm-devel@lfdr.de>; Sat,  4 Jul 2020 05:23:58 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-qNKkk5DBN_imSQAeUCkHNw-1; Fri, 03 Jul 2020 23:23:55 -0400
X-MC-Unique: qNKkk5DBN_imSQAeUCkHNw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32C4C8015F7;
	Sat,  4 Jul 2020 03:23:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 145901E2;
	Sat,  4 Jul 2020 03:23:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C59B5180954D;
	Sat,  4 Jul 2020 03:23:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0643Nd64002593 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 3 Jul 2020 23:23:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 90C331013024; Sat,  4 Jul 2020 03:23:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A49410F8E14
	for <dm-devel@redhat.com>; Sat,  4 Jul 2020 03:23:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CC59858F03
	for <dm-devel@redhat.com>; Sat,  4 Jul 2020 03:23:36 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-433-4Fb0RYHBMWm5L761o5M6CA-1; Fri, 03 Jul 2020 23:23:34 -0400
X-MC-Unique: 4Fb0RYHBMWm5L761o5M6CA-1
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrYjq-0000Ri-9h; Sat, 04 Jul 2020 03:21:15 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Date: Fri,  3 Jul 2020 20:20:17 -0700
Message-Id: <20200704032020.21923-11-rdunlap@infradead.org>
In-Reply-To: <20200704032020.21923-1-rdunlap@infradead.org>
References: <20200704032020.21923-1-rdunlap@infradead.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: platform-driver-x86@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	linux-nfs@vger.kernel.org, Len Brown <lenb@kernel.org>,
	linux-doc@vger.kernel.org, linux-pm@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>,
	"Darrick J . Wong" <darrick.wong@oracle.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	linux-xfs@vger.kernel.org, linux-mm@kvack.org, dm-devel@redhat.com,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	cgroups@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	linux-media@vger.kernel.org
Subject: [dm-devel] [PATCH 10/13] Documentation/admin-guide:
	intel-speed-select: drop doubled words
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Drop the doubled words "that" and "and".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
---
 Documentation/admin-guide/pm/intel-speed-select.rst |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20200701.orig/Documentation/admin-guide/pm/intel-speed-select.rst
+++ linux-next-20200701/Documentation/admin-guide/pm/intel-speed-select.rst
@@ -114,7 +114,7 @@ base performance profile (which is perfo
 Lock/Unlock status
 ~~~~~~~~~~~~~~~~~~
 
-Even if there are multiple performance profiles, it is possible that that they
+Even if there are multiple performance profiles, it is possible that they
 are locked. If they are locked, users cannot issue a command to change the
 performance state. It is possible that there is a BIOS setup to unlock or check
 with your system vendor.
@@ -883,7 +883,7 @@ To enable Intel(R) SST-TF, execute::
         enable:success
 
 In this case, the option "-a" is optional. If set, it enables Intel(R) SST-TF
-feature and also sets the CPUs to high and and low priority using Intel Speed
+feature and also sets the CPUs to high and low priority using Intel Speed
 Select Technology Core Power (Intel(R) SST-CP) features. The CPU numbers passed
 with "-c" arguments are marked as high priority, including its siblings.
 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

