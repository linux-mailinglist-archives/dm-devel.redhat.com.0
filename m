Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2DA49835D
	for <lists+dm-devel@lfdr.de>; Mon, 24 Jan 2022 16:15:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643037310;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FkmQNH1jZob8P/k3/0xSGR+8XHar1tTMLh+Ycj4kxdI=;
	b=K30QnI1THkZ1o5rUPLVSPkAto3GBR/2BgIdvxJPls7JwJlhzE6wU08VfWsLdCpfwCw97+N
	91MY8khIfdXPvpZw4R/le52hPt1fMY47bNuljCLFD7Uk8Ic2r9vxJ+HWIcATwz8Oc2Ic3w
	QTeyT0XA7hzuFrPLvX7RRuxMR4XspjY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-434-iQ7sYV1HM9-raKhOm4PPAA-1; Mon, 24 Jan 2022 10:15:08 -0500
X-MC-Unique: iQ7sYV1HM9-raKhOm4PPAA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C3F68144F3;
	Mon, 24 Jan 2022 15:14:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6128E7D48A;
	Mon, 24 Jan 2022 15:14:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CDC624BB7C;
	Mon, 24 Jan 2022 15:14:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20OFEXSJ018409 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Jan 2022 10:14:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 076487D48A; Mon, 24 Jan 2022 15:14:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from agk-cloud1.hosts.prod.upshift.rdu2.redhat.com
	(agk-cloud1.hosts.prod.upshift.rdu2.redhat.com [10.0.13.154])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E2B7E7E2F4;
	Mon, 24 Jan 2022 15:14:32 +0000 (UTC)
Received: by agk-cloud1.hosts.prod.upshift.rdu2.redhat.com (Postfix,
	from userid 3883)
	id 1EDD0424F088; Mon, 24 Jan 2022 15:14:34 +0000 (GMT)
Date: Mon, 24 Jan 2022 15:14:34 +0000
From: Alasdair G Kergon <agk@redhat.com>
To: Brian Geffon <bgeffon@google.com>
Message-ID: <20220124151434.GB20331@agk-cloud1.hosts.prod.upshift.rdu2.redhat.com>
Mail-Followup-To: Brian Geffon <bgeffon@google.com>,
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com, linux-kernel@vger.kernel.org
References: <20220124150209.22202-1-bgeffon@google.com>
MIME-Version: 1.0
In-Reply-To: <20220124150209.22202-1-bgeffon@google.com>
Organization: Red Hat UK Ltd. Registered in England and Wales, number
	03798903. Registered Office: Amberley Place, 107-111 Peascod Street,
	Windsor, Berkshire, SL4 1TE.
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>,
	Alasdair Kergon <agk@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [dm-devel] [PATCH] dm: introduce a no open flag for deferred
	remove
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 24, 2022 at 07:02:09AM -0800, Brian Geffon wrote:
> When a device is being removed with deferred remove it's
> still possible to open and use the device. This change
> introduces a flag called DM_DEFERRED_REMOVE_NO_OPEN_FLAG
> which when used with DM_DEFERRED_REMOVE will cause any
> new opens to fail with -ENXIO.
 
What is the need for this?
Does it break any semantics assumed by userspace?

Alasdair

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

