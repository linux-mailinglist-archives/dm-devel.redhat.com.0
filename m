Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 44B08214333
	for <lists+dm-devel@lfdr.de>; Sat,  4 Jul 2020 05:24:17 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-Xm3a4ljYPr2Cyo3PEiDIkw-1; Fri, 03 Jul 2020 23:24:13 -0400
X-MC-Unique: Xm3a4ljYPr2Cyo3PEiDIkw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B9D6186A216;
	Sat,  4 Jul 2020 03:24:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6989D7BD6E;
	Sat,  4 Jul 2020 03:24:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 293836C9DA;
	Sat,  4 Jul 2020 03:24:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0643O4Ht002661 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 3 Jul 2020 23:24:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7C323D0B5E; Sat,  4 Jul 2020 03:24:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B08ECF630
	for <dm-devel@redhat.com>; Sat,  4 Jul 2020 03:24:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA5D5800260
	for <dm-devel@redhat.com>; Sat,  4 Jul 2020 03:24:01 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-212-44Amz7o3NsGr9_9WORr8lg-1; Fri, 03 Jul 2020 23:23:59 -0400
X-MC-Unique: 44Amz7o3NsGr9_9WORr8lg-1
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrYj4-0000Ri-7p; Sat, 04 Jul 2020 03:20:27 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Date: Fri,  3 Jul 2020 20:20:07 -0700
Message-Id: <20200704032020.21923-1-rdunlap@infradead.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
Subject: [dm-devel] [PATCH 00/13] Documentation/admin-guide: eliminate
	duplicated words
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Remove duplicated words from Documentation/admin-guide/ files.


Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: cgroups@vger.kernel.org
Cc: dm-devel@redhat.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org
Cc: Trond Myklebust <trond.myklebust@hammerspace.com>
Cc: Anna Schumaker <anna.schumaker@netapp.com>
Cc: linux-nfs@vger.kernel.org
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Len Brown <lenb@kernel.org>
Cc: linux-pm@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org
Cc: Darrick J. Wong <darrick.wong@oracle.com>
Cc: linux-xfs@vger.kernel.org


 Documentation/admin-guide/cgroup-v1/rdma.rst             |    2 +-
 Documentation/admin-guide/cgroup-v2.rst                  |    2 +-
 Documentation/admin-guide/device-mapper/dm-integrity.rst |    4 ++--
 Documentation/admin-guide/media/building.rst             |    4 ++--
 Documentation/admin-guide/mm/ksm.rst                     |    2 +-
 Documentation/admin-guide/nfs/pnfs-block-server.rst      |    2 +-
 Documentation/admin-guide/nfs/pnfs-scsi-server.rst       |    2 +-
 Documentation/admin-guide/perf/arm-ccn.rst               |    2 +-
 Documentation/admin-guide/pm/intel-speed-select.rst      |    4 ++--
 Documentation/admin-guide/pm/intel_pstate.rst            |    2 +-
 Documentation/admin-guide/sysctl/kernel.rst              |    2 +-
 Documentation/admin-guide/tainted-kernels.rst            |    2 +-
 Documentation/admin-guide/xfs.rst                        |    2 +-
 13 files changed, 16 insertions(+), 16 deletions(-)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

