Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 57AB919CDEC
	for <lists+dm-devel@lfdr.de>; Fri,  3 Apr 2020 02:51:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585875079;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2K1xXUt1VqhgtUfjH24zytxlLiMdp2xecGfAmwDpBos=;
	b=PIxTYbKiRSWs1bzS5GmOKpS/8goByIyAp7bmXHWnYisq7wpVDBBotJYc9cn7F4O+OtS1gj
	DzmsF0UgJqLTHE9gyT8sKmEvXj2qBgxC8jyBqBfCc6f7iRdUkYwjnMtXBE40YBVDxORObp
	57LPtR4AHV3ElRAUoEOt+2+dy5KpMUE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-TBx__FAIPw2Gv9iYes5MUw-1; Thu, 02 Apr 2020 20:51:16 -0400
X-MC-Unique: TBx__FAIPw2Gv9iYes5MUw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A1AF1050940;
	Fri,  3 Apr 2020 00:51:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CADF9196AE;
	Fri,  3 Apr 2020 00:51:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E2C928A03C;
	Fri,  3 Apr 2020 00:50:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0330oDK5007849 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Apr 2020 20:50:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1CC1A2166B31; Fri,  3 Apr 2020 00:50:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 18A562166B30
	for <dm-devel@redhat.com>; Fri,  3 Apr 2020 00:50:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B84B88007B3
	for <dm-devel@redhat.com>; Fri,  3 Apr 2020 00:50:10 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-291-1WpjivA5P2mPEZqfAUaXUA-1; Thu, 02 Apr 2020 20:50:08 -0400
X-MC-Unique: 1WpjivA5P2mPEZqfAUaXUA-1
Received: by mail-ed1-f65.google.com with SMTP id i16so7016647edy.11
	for <dm-devel@redhat.com>; Thu, 02 Apr 2020 17:50:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dUEYZjWWMHJXst4WV8j9nCyjHYIXBDcN6VSpUw0gbVM=;
	b=FTpdCWRQP72aCN6UzK+P6fGFr8eWZq0u0UXKKago5Vb623fnpLZWAK9kY/M1KMri9K
	qolO55bCkEpLmPxlrT+/GBI7prD9CDfFW/jMmzi3lLq0McGARbKvXG1ZbQvMFEiLhsPv
	7nAOWCsSDipD1KiJVZpaeDP2+fuaLMbYCS1t+/B6iAhqKWRl36SDA5q5WvBp2VRFQD9b
	cOI1gDhXNUgHT0gRBL6a1iAjCe9YLZ21jxX9PYcEtEvPo4BY7YsQeVWSw+6909cUkOou
	JLIWzlru0jCjIUKLD7b6wQupQXrGA6Oq3IEnke7CC3F+/B5hjR9pY6jKdxUbPY1+RUXF
	6fMQ==
X-Gm-Message-State: AGi0PuaEC5drpiGNsrRFAoj4OZmjzMmq3Ej0pjRtEXj8/zdu68rxHcDI
	1GmOy+swj9fZ0gAYHM+a+u7eWr25ymQ6xlGRs1Fo2Q==
X-Google-Smtp-Source: APiQypKk0+do2txTWB61ucVZLOkss2cjeqGQGndVxlcxXmIo/3Jb4DnDa+Nd/nrjffQoH5hYIo7FhAXp030eLnr8+iU=
X-Received: by 2002:a05:6402:b17:: with SMTP id
	bm23mr5520314edb.165.1585875007220; 
	Thu, 02 Apr 2020 17:50:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200228163456.1587-1-vgoyal@redhat.com>
	<20200228163456.1587-5-vgoyal@redhat.com>
	<CAPcyv4iWfL+KQjjUXqrTKOL8F4M05Vu=imm5tqsD6MO=XLzoMA@mail.gmail.com>
In-Reply-To: <CAPcyv4iWfL+KQjjUXqrTKOL8F4M05Vu=imm5tqsD6MO=XLzoMA@mail.gmail.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 2 Apr 2020 17:49:56 -0700
Message-ID: <CAPcyv4h=xQRPBwfy6xMjUONk41aO0xBYHpu9auSHdG17CWdv=g@mail.gmail.com>
To: Vivek Goyal <vgoyal@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0330oDK5007849
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>,
	linux-nvdimm <linux-nvdimm@lists.01.org>, david <david@fromorbit.com>,
	device-mapper development <dm-devel@redhat.com>,
	Christoph Hellwig <hch@infradead.org>, jmoyer <jmoyer@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>
Subject: Re: [dm-devel] [PATCH v6 4/6] dm,
	dax: Add dax zero_page_range operation
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 31, 2020 at 12:34 PM Dan Williams <dan.j.williams@intel.com> wrote:
>
> [ Add Mike ]
>
> On Fri, Feb 28, 2020 at 8:35 AM Vivek Goyal <vgoyal@redhat.com> wrote:
> >
> > This patch adds support for dax zero_page_range operation to dm targets.
>
> Mike,
>
> Sorry, I should have pinged you earlier, but could you take a look at
> this patch and ack it if it looks ok to go through the nvdimm tree
> with the rest of the series?

I'm going to proceed with pushing this into -next to get more exposure
and check back later next week about pushing it to Linus. It looks
good to me and it unblocks Vivek on his virtio-fs work, but still
don't want to push device-mapper bits without device-mapper maintainer
Ack.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

