Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F697441DCE
	for <lists+dm-devel@lfdr.de>; Mon,  1 Nov 2021 17:13:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635783216;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GzVhSCadZEG2e9/07SnR9HRRnFlarHDp0FhKMbtkdLE=;
	b=NbiTrqt/fKJoEAgHtPTOhLRBA0lq+inky98QYbZRZLM6jJN6iQecq8A3+sa84e1zl+kfQO
	XcVSMtkR0E+B2nXkwgQEpBqbfUHZWbY93JmsH2kDFD5YEFJ1/0batVKvgAdXQ7I3vQnl3z
	BY/nRfahp/Se+4UWpN9LLpj0hEJM2gA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-v8R1Rr4KPYOGphXSmTNeTw-1; Mon, 01 Nov 2021 12:13:34 -0400
X-MC-Unique: v8R1Rr4KPYOGphXSmTNeTw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D1988026AD;
	Mon,  1 Nov 2021 16:13:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 849155F4EE;
	Mon,  1 Nov 2021 16:13:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CB8C04EA2A;
	Mon,  1 Nov 2021 16:13:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A1GD3tC002865 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 1 Nov 2021 12:13:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 65D91400DEF8; Mon,  1 Nov 2021 16:13:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 603B34010E89
	for <dm-devel@redhat.com>; Mon,  1 Nov 2021 16:13:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 433B1899EC1
	for <dm-devel@redhat.com>; Mon,  1 Nov 2021 16:13:03 +0000 (UTC)
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
	[209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-59-ETeGta7-MuyYtVq1qAO_Zg-1; Mon, 01 Nov 2021 12:13:02 -0400
X-MC-Unique: ETeGta7-MuyYtVq1qAO_Zg-1
Received: by mail-qv1-f70.google.com with SMTP id
	kd7-20020a056214400700b003b54713452cso1133571qvb.13
	for <dm-devel@redhat.com>; Mon, 01 Nov 2021 09:13:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=+G6SzjVTR+LCyYNlG0zbcp2+gduPxDNU+2Zc+nwBRpo=;
	b=iN6ls7sBjYf+kwXI3LT8SVqY0UxiqOKaYorm2VSxf6fmDwQ4BOMLCeMzigngrz6a8C
	xubPpCWblWM6kPFAM+5vyroVJjm/8666RAJrzLNr+THnlSUDlKGVzdA0A6Pe9d+TY5IA
	eC+WqYVwwYG8I/FwgKljD0e+sMA3u61LLTdbNWxjaixlhsS3PT/zlDr6FfASdz06UHjA
	XqIldEWEcu5/rTSBBuffh5QoS6b9gv5eIWZ4jPrkpn5T85RAMWESHgmS4bi95NkzxwSK
	jhy3xsN0jX6R6uVwIXlTOxOJ1juBkMbgehfp4BdKm96DwUSyuaL/hUP9iX3R9M4EE3m6
	kj0Q==
X-Gm-Message-State: AOAM530wMzypdcRG5YaBFQcXgct4BXWAQIePchKc7Z9nylwwHCkISMvP
	HoRodA8hX6+q0U6Di4APuxVLr+7ou6DtM/gNSyxCCqArU9czvIkycGt+JYTGM7r/fJl+g7eJ0Mv
	xVd2Oth+HpM5rmw==
X-Received: by 2002:a0c:e708:: with SMTP id d8mr23265257qvn.62.1635783179261; 
	Mon, 01 Nov 2021 09:12:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/H7B1fdn7PP13//AwKmpta1av9FRTtOajPRoBskVHgoJcCnXd+0D44u/s4udzcALoTqA+Rw==
X-Received: by 2002:a0c:e708:: with SMTP id d8mr23264758qvn.62.1635783175189; 
	Mon, 01 Nov 2021 09:12:55 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52])
	by smtp.gmail.com with ESMTPSA id v16sm167031qtw.90.2021.11.01.09.12.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 01 Nov 2021 09:12:54 -0700 (PDT)
Date: Mon, 1 Nov 2021 12:12:53 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Dan Williams <dan.j.williams@intel.com>
Message-ID: <YYASBVuorCedsnRL@redhat.com>
References: <20211018044054.1779424-1-hch@lst.de>
	<20211018044054.1779424-2-hch@lst.de>
	<CAPcyv4hrEPizMOH-XhCqh=23EJDG=W6VwvQ1pVstfe-Jm-AsiQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPcyv4hrEPizMOH-XhCqh=23EJDG=W6VwvQ1pVstfe-Jm-AsiQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: dm-devel@redhat.com
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>,
	linux-s390 <linux-s390@vger.kernel.org>, linux-erofs@lists.ozlabs.org,
	virtualization@lists.linux-foundation.org,
	linux-xfs <linux-xfs@vger.kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-ext4 <linux-ext4@vger.kernel.org>,
	Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH 01/11] dm: make the DAX support dependend on
	CONFIG_FS_DAX
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Oct 27 2021 at  4:53P -0400,
Dan Williams <dan.j.williams@intel.com> wrote:

> On Sun, Oct 17, 2021 at 9:41 PM Christoph Hellwig <hch@lst.de> wrote:
> >
> > The device mapper DAX support is all hanging off a block device and thus
> > can't be used with device dax.  Make it depend on CONFIG_FS_DAX instead
> > of CONFIG_DAX_DRIVER.  This also means that bdev_dax_pgoff only needs to
> > be built under CONFIG_FS_DAX now.
> 
> Looks good.
> 
> Mike, can I get an ack to take this through nvdimm.git? (you'll likely
> see me repeat this question on subsequent patches in this series).

Sorry for late reply, but I see you punted on pushing for 5.16 merge
anyway (I'm sure my lack of response didn't help, sorry about that).

Acked-by: Mike Snitzer <snitzer@redhat.com>

Thanks!

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

