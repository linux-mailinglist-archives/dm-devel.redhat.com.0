Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3FC8A214F23
	for <lists+dm-devel@lfdr.de>; Sun,  5 Jul 2020 22:03:28 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-WiklaS-dNDaAqQ__jYMSAA-1; Sun, 05 Jul 2020 16:03:24 -0400
X-MC-Unique: WiklaS-dNDaAqQ__jYMSAA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79583107ACCD;
	Sun,  5 Jul 2020 20:03:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BBB40C0DBA;
	Sun,  5 Jul 2020 20:03:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E4A186C9F4;
	Sun,  5 Jul 2020 20:02:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 065K2PIA023078 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 5 Jul 2020 16:02:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 30DF8110F0A1; Sun,  5 Jul 2020 20:02:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CD75110F0A0
	for <dm-devel@redhat.com>; Sun,  5 Jul 2020 20:02:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DA8E858EE9
	for <dm-devel@redhat.com>; Sun,  5 Jul 2020 20:02:23 +0000 (UTC)
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-384-PVSh69JnNVq6qbfPZQNZEw-1;
	Sun, 05 Jul 2020 16:02:20 -0400
X-MC-Unique: PVSh69JnNVq6qbfPZQNZEw-1
Received: from lwn.net (localhost [127.0.0.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C57E82E2;
	Sun,  5 Jul 2020 20:02:17 +0000 (UTC)
Date: Sun, 5 Jul 2020 14:02:16 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <20200705140216.33a0d8f5@lwn.net>
In-Reply-To: <20200704032020.21923-1-rdunlap@infradead.org>
References: <20200704032020.21923-1-rdunlap@infradead.org>
Organization: LWN.net
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 065K2PIA023078
X-loop: dm-devel@redhat.com
Cc: platform-driver-x86@vger.kernel.org, linux-nfs@vger.kernel.org,
	Len Brown <lenb@kernel.org>, linux-doc@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, "Darrick J .
	Wong" <darrick.wong@oracle.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	linux-xfs@vger.kernel.org, linux-mm@kvack.org, dm-devel@redhat.com,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	cgroups@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	linux-media@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 00/13] Documentation/admin-guide: eliminate
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri,  3 Jul 2020 20:20:07 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> Remove duplicated words from Documentation/admin-guide/ files.
> 
> 
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: cgroups@vger.kernel.org
> Cc: dm-devel@redhat.com
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-media@vger.kernel.org
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-mm@kvack.org
> Cc: Trond Myklebust <trond.myklebust@hammerspace.com>
> Cc: Anna Schumaker <anna.schumaker@netapp.com>
> Cc: linux-nfs@vger.kernel.org
> Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> Cc: Len Brown <lenb@kernel.org>
> Cc: linux-pm@vger.kernel.org
> Cc: platform-driver-x86@vger.kernel.org
> Cc: Darrick J. Wong <darrick.wong@oracle.com>
> Cc: linux-xfs@vger.kernel.org
> 
> 
>  Documentation/admin-guide/cgroup-v1/rdma.rst             |    2 +-
>  Documentation/admin-guide/cgroup-v2.rst                  |    2 +-
>  Documentation/admin-guide/device-mapper/dm-integrity.rst |    4 ++--
>  Documentation/admin-guide/media/building.rst             |    4 ++--
>  Documentation/admin-guide/mm/ksm.rst                     |    2 +-
>  Documentation/admin-guide/nfs/pnfs-block-server.rst      |    2 +-
>  Documentation/admin-guide/nfs/pnfs-scsi-server.rst       |    2 +-
>  Documentation/admin-guide/perf/arm-ccn.rst               |    2 +-
>  Documentation/admin-guide/pm/intel-speed-select.rst      |    4 ++--
>  Documentation/admin-guide/pm/intel_pstate.rst            |    2 +-
>  Documentation/admin-guide/sysctl/kernel.rst              |    2 +-
>  Documentation/admin-guide/tainted-kernels.rst            |    2 +-
>  Documentation/admin-guide/xfs.rst                        |    2 +-
>  13 files changed, 16 insertions(+), 16 deletions(-)
> 
I've applied this set, thanks.

jon


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

