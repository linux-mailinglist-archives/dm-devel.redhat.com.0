Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDF961591
	for <lists+dm-devel@lfdr.de>; Sun,  7 Jul 2019 18:37:53 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C78AAC010924;
	Sun,  7 Jul 2019 16:37:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 17041378D;
	Sun,  7 Jul 2019 16:37:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8018D18037CD;
	Sun,  7 Jul 2019 16:37:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x67GaTeW016373 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 7 Jul 2019 12:36:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BF3F3608A5; Sun,  7 Jul 2019 16:36:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 072FE4E6DF;
	Sun,  7 Jul 2019 16:36:16 +0000 (UTC)
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A88F2308339B;
	Sun,  7 Jul 2019 16:35:09 +0000 (UTC)
Received: from callcc.thunk.org (75-104-86-74.mobility.exede.net
	[75.104.86.74] (may be forged)) (authenticated bits=0)
	(User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x67GYGms007613
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sun, 7 Jul 2019 12:34:23 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
	id 26D6A42002E; Sun,  7 Jul 2019 12:34:15 -0400 (EDT)
Date: Sun, 7 Jul 2019 12:34:15 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Pankaj Gupta <pagupta@redhat.com>
Message-ID: <20190707163415.GA19775@mit.edu>
Mail-Followup-To: Theodore Ts'o <tytso@mit.edu>,
	Pankaj Gupta <pagupta@redhat.com>, dm-devel@redhat.com,
	linux-nvdimm@lists.01.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, kvm@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-acpi@vger.kernel.org,
	qemu-devel@nongnu.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, dan.j.williams@intel.com,
	zwisler@kernel.org, vishal.l.verma@intel.com, dave.jiang@intel.com,
	mst@redhat.com, jasowang@redhat.com, willy@infradead.org,
	rjw@rjwysocki.net, hch@infradead.org, lenb@kernel.org, jack@suse.cz,
	adilger.kernel@dilger.ca, darrick.wong@oracle.com,
	lcapitulino@redhat.com, kwolf@redhat.com, imammedo@redhat.com,
	jmoyer@redhat.com, nilal@redhat.com, riel@surriel.com,
	stefanha@redhat.com, aarcange@redhat.com, david@redhat.com,
	david@fromorbit.com, cohuck@redhat.com,
	xiaoguangrong.eric@gmail.com, pbonzini@redhat.com,
	yuval.shaia@oracle.com, kilobyte@angband.pl, jstaron@google.com,
	rdunlap@infradead.org, snitzer@redhat.com
References: <20190705140328.20190-1-pagupta@redhat.com>
	<20190705140328.20190-7-pagupta@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190705140328.20190-7-pagupta@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.44]); Sun, 07 Jul 2019 16:36:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Sun, 07 Jul 2019 16:36:11 +0000 (UTC) for IP:'18.9.28.11'
	DOMAIN:'outgoing-auth-1.mit.edu' HELO:'outgoing.mit.edu'
	FROM:'tytso@mit.edu' RCPT:''
X-RedHat-Spam-Score: -2.298  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 18.9.28.11 outgoing-auth-1.mit.edu 18.9.28.11
	outgoing-auth-1.mit.edu <tytso@mit.edu>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: cohuck@redhat.com, jack@suse.cz, kvm@vger.kernel.org, mst@redhat.com,
	jasowang@redhat.com, david@fromorbit.com, qemu-devel@nongnu.org,
	virtualization@lists.linux-foundation.org, dm-devel@redhat.com,
	adilger.kernel@dilger.ca, zwisler@kernel.org,
	aarcange@redhat.com, dave.jiang@intel.com, jstaron@google.com,
	linux-nvdimm@lists.01.org, vishal.l.verma@intel.com,
	david@redhat.com, willy@infradead.org, hch@infradead.org,
	linux-acpi@vger.kernel.org, jmoyer@redhat.com,
	linux-ext4@vger.kernel.org, lenb@kernel.org, kilobyte@angband.pl,
	rdunlap@infradead.org, riel@surriel.com, yuval.shaia@oracle.com,
	stefanha@redhat.com, pbonzini@redhat.com,
	dan.j.williams@intel.com, lcapitulino@redhat.com,
	kwolf@redhat.com, nilal@redhat.com, xiaoguangrong.eric@gmail.com,
	snitzer@redhat.com, darrick.wong@oracle.com, rjw@rjwysocki.net,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, imammedo@redhat.com
Subject: Re: [dm-devel] [PATCH v15 6/7] ext4: disable map_sync for async
	flush
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Sun, 07 Jul 2019 16:37:52 +0000 (UTC)

On Fri, Jul 05, 2019 at 07:33:27PM +0530, Pankaj Gupta wrote:
> Dont support 'MAP_SYNC' with non-DAX files and DAX files
> with asynchronous dax_device. Virtio pmem provides
> asynchronous host page cache flush mechanism. We don't
> support 'MAP_SYNC' with virtio pmem and ext4.
> 
> Signed-off-by: Pankaj Gupta <pagupta@redhat.com>
> Reviewed-by: Jan Kara <jack@suse.cz>

Acked-by: Theodore Ts'o <tytso@mit.edu>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
