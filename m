Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E6D6032E202
	for <lists+dm-devel@lfdr.de>; Fri,  5 Mar 2021 07:11:05 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-OqOae6vMN2ykW7l5MSr4Zw-1; Fri, 05 Mar 2021 01:11:02 -0500
X-MC-Unique: OqOae6vMN2ykW7l5MSr4Zw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4273A19057BB;
	Fri,  5 Mar 2021 06:10:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 551A31001901;
	Fri,  5 Mar 2021 06:10:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C68CC18095CA;
	Fri,  5 Mar 2021 06:10:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1256AOn1016021 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 5 Mar 2021 01:10:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4A8425707DC; Fri,  5 Mar 2021 06:10:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F64F5B9525
	for <dm-devel@redhat.com>; Fri,  5 Mar 2021 06:10:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B457802A60
	for <dm-devel@redhat.com>; Fri,  5 Mar 2021 06:10:21 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-234-t8N9zNCrPzOSeSsBpspQJw-1;
	Fri, 05 Mar 2021 01:10:12 -0500
X-MC-Unique: t8N9zNCrPzOSeSsBpspQJw-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 7893F68BFE; Fri,  5 Mar 2021 07:10:08 +0100 (CET)
Date: Fri, 5 Mar 2021 07:10:08 +0100
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20210305061008.GA15141@lst.de>
References: <20210208105530.3072869-1-ruansy.fnst@cn.fujitsu.com>
	<20210208105530.3072869-3-ruansy.fnst@cn.fujitsu.com>
	<20210210132139.GC30109@lst.de> <20210304224250.GF3419940@magnolia>
MIME-Version: 1.0
In-Reply-To: <20210304224250.GF3419940@magnolia>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: y-goto@fujitsu.com, qi.fuli@fujitsu.com,
	Shiyang Ruan <ruansy.fnst@cn.fujitsu.com>, snitzer@redhat.com,
	linux-nvdimm@lists.01.org, rgoldwyn@suse.de,
	darrick.wong@oracle.com, david@fromorbit.com,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-mm@kvack.org, dm-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, dan.j.williams@intel.com,
	Christoph Hellwig <hch@lst.de>, agk@redhat.com
Subject: Re: [dm-devel] [PATCH v3 02/11] blk: Introduce ->corrupted_range()
 for block device
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 04, 2021 at 02:42:50PM -0800, Darrick J. Wong wrote:
> My vision here, however, is to establish upcalls for /both/ types of
> stroage.

I already have patches for doing these kinds of callbacks properly
for the block layer. They will be posted shortly.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

