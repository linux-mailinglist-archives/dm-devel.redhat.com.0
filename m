Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id D40061FD270
	for <lists+dm-devel@lfdr.de>; Wed, 17 Jun 2020 18:41:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592412113;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3Vbb5FYblf/YL0z0IhoQ/xzfW0iXOP0L5OYpLjvIBJE=;
	b=RDJSi3hq/GGTxadaw7+CK5+8x2LVghpUL6P2+Hob6OKYJuLWe356OyvQDwOV4SgYzcr2zr
	KxGSHjk3qm+pUe5matv5rHdF6gGTCSaWHzTpzlpTE2DpBMnKQ/SW3Pf4PorPJ4Cn8eaijt
	zFSnF+vB0BR/I5Qx1GzG/I72J6p4rCE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-XzlJrM-wMtuGJYkBbLj_rw-1; Wed, 17 Jun 2020 12:41:49 -0400
X-MC-Unique: XzlJrM-wMtuGJYkBbLj_rw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3641B1801256;
	Wed, 17 Jun 2020 16:41:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B60E97CAA8;
	Wed, 17 Jun 2020 16:41:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 90788833CA;
	Wed, 17 Jun 2020 16:41:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05HGfDts026197 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 17 Jun 2020 12:41:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BB31A6ED96; Wed, 17 Jun 2020 16:41:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E6C16EDBE;
	Wed, 17 Jun 2020 16:41:10 +0000 (UTC)
Date: Wed, 17 Jun 2020 12:41:09 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20200617164108.GA12131@redhat.com>
References: <20200612155911.96528-1-yehs2007@zoho.com>
	<alpine.LRH.2.02.2006130839480.27500@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2006130839480.27500@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Huaisheng Ye <yehs2007@zoho.com>, Huaisheng Ye <yehs1@lenovo.com>,
	dm-devel@redhat.com, agk@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [dm-devel] dm writecache: correct uncommitted_block when
 discarding uncommitted entry
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
Content-Disposition: inline

On Sat, Jun 13 2020 at  8:40am -0400,
Mikulas Patocka <mpatocka@redhat.com> wrote:

> 
> 
> On Fri, 12 Jun 2020, Huaisheng Ye wrote:
> 
> > From: Huaisheng Ye <yehs1@lenovo.com>
> > 
> > When uncommitted entry has been discarded, correct wc->uncommitted_block
> > for getting the exact number.
> > 
> > Signed-off-by: Huaisheng Ye <yehs1@lenovo.com>
> 
> Acked-by: Mikulas Patocka <mpatocka@redhat.com>
> 
> Also, add:
> Cc: stable@vger.kernel.org

I picked this up for 5.8 but I inverted the patch order because this
stable@ fix was dependent on the prior patch to skip waiting if in pmem
mode (due to locality of changes within same function).

See:
https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.8&id=39495b12ef1cf602e6abd350dce2ef4199906531

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

