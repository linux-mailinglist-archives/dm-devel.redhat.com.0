Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id D949F214334
	for <lists+dm-devel@lfdr.de>; Sat,  4 Jul 2020 05:24:19 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-Yo8sWI3VM1aW-IXCl63Aow-1; Fri, 03 Jul 2020 23:24:16 -0400
X-MC-Unique: Yo8sWI3VM1aW-IXCl63Aow-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5643A800FEA;
	Sat,  4 Jul 2020 03:24:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3663D5FC2C;
	Sat,  4 Jul 2020 03:24:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E44FE1809561;
	Sat,  4 Jul 2020 03:24:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0643O5Gn002668 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 3 Jul 2020 23:24:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 97502218ADC8; Sat,  4 Jul 2020 03:24:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 840A3218ADC4
	for <dm-devel@redhat.com>; Sat,  4 Jul 2020 03:24:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80A9F185A78B
	for <dm-devel@redhat.com>; Sat,  4 Jul 2020 03:24:03 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-4-4XlnzO7QOCmK_iUP7Bd19w-1; Fri, 03 Jul 2020 23:24:01 -0400
X-MC-Unique: 4XlnzO7QOCmK_iUP7Bd19w-1
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrYjI-0000Ri-CC; Sat, 04 Jul 2020 03:20:41 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Date: Fri,  3 Jul 2020 20:20:10 -0700
Message-Id: <20200704032020.21923-4-rdunlap@infradead.org>
In-Reply-To: <20200704032020.21923-1-rdunlap@infradead.org>
References: <20200704032020.21923-1-rdunlap@infradead.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
Subject: [dm-devel] [PATCH 03/13] Documentation/admin-guide: dm-integrity:
	drop doubled words
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Drop the doubled words "on" and "the".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: dm-devel@redhat.com
---
 Documentation/admin-guide/device-mapper/dm-integrity.rst |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20200701.orig/Documentation/admin-guide/device-mapper/dm-integrity.rst
+++ linux-next-20200701/Documentation/admin-guide/device-mapper/dm-integrity.rst
@@ -45,7 +45,7 @@ To use the target for the first time:
    will format the device
 3. unload the dm-integrity target
 4. read the "provided_data_sectors" value from the superblock
-5. load the dm-integrity target with the the target size
+5. load the dm-integrity target with the target size
    "provided_data_sectors"
 6. if you want to use dm-integrity with dm-crypt, load the dm-crypt target
    with the size "provided_data_sectors"
@@ -99,7 +99,7 @@ interleave_sectors:number
 	the superblock is used.
 
 meta_device:device
-	Don't interleave the data and metadata on on device. Use a
+	Don't interleave the data and metadata on the device. Use a
 	separate device for metadata.
 
 buffer_sectors:number

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

