Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B950A20CD28
	for <lists+dm-devel@lfdr.de>; Mon, 29 Jun 2020 10:08:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593418136;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dL9lBWKMAxVrEbJnug2asAm3UkHU/K29t/Cc+kgDcHk=;
	b=QBOm21SxuOxjvdXu1tucUAvMGQEra3F95H2vgAyrVpk7CyM58IrTE+FDH6PLxj/bikC0mj
	JhPLH9c0eM98pGvYNoGPg8KDV+dbIk2vxTzf7tXCyMLUfhs8jH02ZwHQLzf9yDIhZR5jWx
	uGOAPa8d6SwDOOlF09hxoNqFEesNDdc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-T48RdNVROaOCr18E1tQnJg-1; Mon, 29 Jun 2020 04:08:54 -0400
X-MC-Unique: T48RdNVROaOCr18E1tQnJg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80934107ACF3;
	Mon, 29 Jun 2020 08:08:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B06F60BEC;
	Mon, 29 Jun 2020 08:08:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7DD598787E;
	Mon, 29 Jun 2020 08:08:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05T88e6K007965 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 04:08:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E995733244; Mon, 29 Jun 2020 08:08:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E4E658A4D1
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 08:08:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D1231859164
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 08:08:37 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-43-uPRdo8y0OYWnEzk-_61Q-w-1;
	Mon, 29 Jun 2020 04:08:34 -0400
X-MC-Unique: uPRdo8y0OYWnEzk-_61Q-w-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 8689868B02; Mon, 29 Jun 2020 10:08:31 +0200 (CEST)
Date: Mon, 29 Jun 2020 10:08:31 +0200
From: Christoph Hellwig <hch@lst.de>
To: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
Message-ID: <20200629080831.GA32117@lst.de>
References: <20200627073159.2447325-1-hch@lst.de>
	<SN4PR0401MB3598A198ACA6126D96E949B59B6E0@SN4PR0401MB3598.namprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <SN4PR0401MB3598A198ACA6126D96E949B59B6E0@SN4PR0401MB3598.namprd04.prod.outlook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>,
	"cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>, Li Zefan <lizefan@huawei.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
	Dennis Zhou <dennis@kernel.org>, Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] drive-by blk-cgroup cleanups
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Jun 29, 2020 at 08:05:07AM +0000, Johannes Thumshirn wrote:
> Btw what ever happened to https://lore.kernel.org/r/20200430150356.35691-1-johannes.thumshirn@wdc.com?

You'll have to ask Jens :)  Note that your patch 2 overlaps with this
series.  I thik my version is a little nicer, given that
blkcg_bio_issue_check is a very strange function doing multiple things
as-is.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

