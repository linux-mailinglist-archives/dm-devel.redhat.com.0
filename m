Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 08CD521CB3D
	for <lists+dm-devel@lfdr.de>; Sun, 12 Jul 2020 22:00:50 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-O4Mm-hRpMnKAZY49B-fGnw-1; Sun, 12 Jul 2020 16:00:45 -0400
X-MC-Unique: O4Mm-hRpMnKAZY49B-fGnw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A4898027E3;
	Sun, 12 Jul 2020 20:00:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F04610013DB;
	Sun, 12 Jul 2020 20:00:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3AB6C93F9B;
	Sun, 12 Jul 2020 20:00:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06CJxj7U004676 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 12 Jul 2020 15:59:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1F2FF1009A07; Sun, 12 Jul 2020 19:59:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A9C01009A04
	for <dm-devel@redhat.com>; Sun, 12 Jul 2020 19:59:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78C1880CC32
	for <dm-devel@redhat.com>; Sun, 12 Jul 2020 19:59:41 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-300-pkKA-NzZPySyZkdnttAl3w-1; Sun, 12 Jul 2020 15:59:37 -0400
X-MC-Unique: pkKA-NzZPySyZkdnttAl3w-1
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jui8K-0008N0-UE; Sun, 12 Jul 2020 19:59:33 +0000
Date: Sun, 12 Jul 2020 20:59:32 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Austin Chang <austin880625@gmail.com>
Message-ID: <20200712195932.GV12769@casper.infradead.org>
References: <20200712194039.329035-1-austin880625@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200712194039.329035-1-austin880625@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <snitzer@redhat.com>, linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
	dm-devel@redhat.com, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm-cache: document zeroing metadata device
	step
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Jul 13, 2020 at 03:40:39AM +0800, Austin Chang wrote:
> +  # When using dmsetup directly instead of volume manager like lvm2,
> +  # the first 4k of the metadata device should be zeroed to indicate
> +  # empty metadata.
> +  dd if=/dev/zero of=/dev/mapper/metadata bs=4k conv=notrunc

... don't you need 'count=1' or you'll zero the entire device?

>    dmsetup create my_cache --table '0 41943040 cache /dev/mapper/metadata \
>  	  /dev/mapper/ssd /dev/mapper/origin 512 1 writeback default 0'
>    dmsetup create my_cache --table '0 41943040 cache /dev/mapper/metadata \
> -- 
> 2.26.2
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

