Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 903483FDD3E
	for <lists+dm-devel@lfdr.de>; Wed,  1 Sep 2021 15:44:08 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-OLAQ9ua6ObecuynTgZVmYQ-1; Wed, 01 Sep 2021 09:44:06 -0400
X-MC-Unique: OLAQ9ua6ObecuynTgZVmYQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E49BD1034B22;
	Wed,  1 Sep 2021 13:43:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5211B5C232;
	Wed,  1 Sep 2021 13:43:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 305E41809C98;
	Wed,  1 Sep 2021 13:43:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 181DaQ5H032025 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Sep 2021 09:36:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1DF54100FF6E; Wed,  1 Sep 2021 13:36:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1975F11558B3
	for <dm-devel@redhat.com>; Wed,  1 Sep 2021 13:36:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 31B7D18A01A0
	for <dm-devel@redhat.com>; Wed,  1 Sep 2021 13:36:23 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-4-HOPpGCjBM0CiOKHr-o4n8A-1;
	Wed, 01 Sep 2021 09:36:21 -0400
X-MC-Unique: HOPpGCjBM0CiOKHr-o4n8A-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id A57EC6736F; Wed,  1 Sep 2021 15:36:18 +0200 (CEST)
Date: Wed, 1 Sep 2021 15:36:18 +0200
From: Christoph Hellwig <hch@lst.de>
To: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Message-ID: <20210901133618.GA16687@lst.de>
References: <68dde454-965a-0c44-374a-a0ca277150ee@linux.vnet.ibm.com>
MIME-Version: 1.0
In-Reply-To: <68dde454-965a-0c44-374a-a0ca277150ee@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, sachinp <sachinp@linux.vnet.ibm.com>, jack@suse.cz,
	linux-scsi <linux-scsi@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, dm-devel@redhat.com,
	linux-next <linux-next@vger.kernel.org>, dougmill@us.ibm.com,
	Brian King <brking@linux.vnet.ibm.com>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hch@lst.de
Subject: Re: [dm-devel] [next-20210827][ppc][multipathd] INFO: task hung in
 dm_table_add_target
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 01, 2021 at 04:47:26PM +0530, Abdul Haleem wrote:
> Greeting's
>
> multiple task hung while adding the vfc disk back to the multipath on my 
> powerpc box running linux-next kernel

Can you retry to reproduce this with lockdep enabled to see if there
is anything interesting holding this lock?

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

