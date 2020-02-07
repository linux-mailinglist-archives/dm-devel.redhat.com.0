Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 5E29E155C40
	for <lists+dm-devel@lfdr.de>; Fri,  7 Feb 2020 17:58:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581094707;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=T1r7TJeMh4pKrIhg9Gb/+ldQEZrMEkSnhxlsWBLAefc=;
	b=YIPKVSoAlabLDnZy5bGoYUzjd9sAUeWOb8NGyNbUC/Fr8LpHG/yUYMCESwup5e/UbqBYbm
	TituS3EiCP3Y0aXOFjvmi4QrPmscKvZvz3xx7BMXakMaOxZK1m9xQVZc41TdiWLhX0f4Q2
	dBTEOvDXslSYAK43JzrdfgOhif1bQvo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-uasWD9odPVK7gfsayygCeA-1; Fri, 07 Feb 2020 11:58:22 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6FFD1084426;
	Fri,  7 Feb 2020 16:58:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9129C8ECE3;
	Fri,  7 Feb 2020 16:58:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E8ECD8175D;
	Fri,  7 Feb 2020 16:58:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 017Gvwp7010706 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 7 Feb 2020 11:57:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1CBCA2049CB5; Fri,  7 Feb 2020 16:57:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 16A352093CE0
	for <dm-devel@redhat.com>; Fri,  7 Feb 2020 16:57:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8042802E61
	for <dm-devel@redhat.com>; Fri,  7 Feb 2020 16:57:55 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-168-U2BVAo3zPIOV2wWfTMVPvw-1; Fri, 07 Feb 2020 11:57:53 -0500
Received: by mail-ot1-f67.google.com with SMTP id g64so2747132otb.13
	for <dm-devel@redhat.com>; Fri, 07 Feb 2020 08:57:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DoXHMrXc9C3nIDwMKcXgxUp8VuOy5v934gcrKt8olSo=;
	b=KVJJyHAXxFcieswXSShuYHZ5JQyw18suBg9qXYsSTy7YJjxFT/IaWa4CAgE3gnC066
	VxLPiObO4WMUvDhXtrFfsrKSkXNOKfwV7UAdAQfu498lwBRGTEWrIisO71HIYEzqXbzi
	e++VWGV6yp6G6Iy1jcWoOtaso+0OS5dUQkAm/N1y6Svja2D2RS1rPMc1sItb66ref/rT
	mNHV5vTY/V6c4Zv5CFKF8uhPnh1VkWAY90oMwA5id4711HuVp7pITDJNovNqkT6C2ZoF
	CkWT+2zSKzyuzLYIsLmR/TRoLuX7QKZbF0VL4IolKHytbpv1rAQY6Z+4hqTjbvrqkO2V
	Lacg==
X-Gm-Message-State: APjAAAXw0kesnPC0D9LZhV8vFfGZq8GPbEFbXF8/0lImV6gBS788FQ72
	tAcmaeStysRb7rSOcpUeS0CCHc09cqoqKsUOpJE1ffGr
X-Google-Smtp-Source: APXvYqwZEd2ifdEG5DmRy5nKYxx/U0RJ8V18sdsJ2ufK7/ON2ZEyKZ8XWshkO52/AgDVnNwawXJ5TiRbMjZ0ofXEOh4=
X-Received: by 2002:a9d:64d8:: with SMTP id n24mr215119otl.71.1581094670173;
	Fri, 07 Feb 2020 08:57:50 -0800 (PST)
MIME-Version: 1.0
References: <20200203200029.4592-1-vgoyal@redhat.com>
	<20200203200029.4592-2-vgoyal@redhat.com>
	<20200205183050.GA26711@infradead.org>
	<20200205200259.GE14544@redhat.com>
	<CAPcyv4iY=gw86UDLqpiCtathGXRUuxOMuU=unwxzA-cm=0x+Sg@mail.gmail.com>
	<20200206074142.GB28365@infradead.org>
In-Reply-To: <20200206074142.GB28365@infradead.org>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 7 Feb 2020 08:57:39 -0800
Message-ID: <CAPcyv4iTBTOuKjQX3eoojLM=Eai_pfARXmzpMAtgi5OWBHXvzQ@mail.gmail.com>
To: Christoph Hellwig <hch@infradead.org>
X-MC-Unique: U2BVAo3zPIOV2wWfTMVPvw-1
X-MC-Unique: uasWD9odPVK7gfsayygCeA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 017Gvwp7010706
X-loop: dm-devel@redhat.com
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>, linux-nvdimm <linux-nvdimm@lists.01.org>
Subject: Re: [dm-devel] [PATCH 1/5] dax,
	pmem: Add a dax operation zero_page_range
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 5, 2020 at 11:41 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Wed, Feb 05, 2020 at 04:40:44PM -0800, Dan Williams wrote:
> > > I don't have any reason not to pass phys_addr_t. If that sounds better,
> > > will make changes.
> >
> > The problem is device-mapper. That wants to use offset to route
> > through the map to the leaf device. If it weren't for the firmware
> > communication requirement you could do:
> >
> > dax_direct_access(...)
> > generic_dax_zero_page_range(...)
> >
> > ...but as long as the firmware error clearing path is required I think
> > we need to do pass the pgoff through the interface and do the pgoff to
> > virt / phys translation inside the ops handler.
>
> Maybe phys_addr_t was the wrong type - but why do we split the offset
> into the block device argument into a pgoff and offset into page instead
> of a single 64-bit value?

Oh, got it yes, that looks odd for sub-page zeroing. Yes, let's just
have one device relative byte-offset.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

