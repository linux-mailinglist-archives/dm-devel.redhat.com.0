Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 105C3454BE7
	for <lists+dm-devel@lfdr.de>; Wed, 17 Nov 2021 18:24:45 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-tLK2wXxLPOyLurNikjZCLg-1; Wed, 17 Nov 2021 12:24:43 -0500
X-MC-Unique: tLK2wXxLPOyLurNikjZCLg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 191D318125CC;
	Wed, 17 Nov 2021 17:24:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D12721F470;
	Wed, 17 Nov 2021 17:24:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 671564E58F;
	Wed, 17 Nov 2021 17:24:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AHHO2qR000692 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 17 Nov 2021 12:24:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7699C404727A; Wed, 17 Nov 2021 17:24:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 728644047279
	for <dm-devel@redhat.com>; Wed, 17 Nov 2021 17:24:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5AA558007B1
	for <dm-devel@redhat.com>; Wed, 17 Nov 2021 17:24:02 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
	[209.85.216.45]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-308-qMEGhumEPW2DHNwxxx6H4Q-1; Wed, 17 Nov 2021 12:23:58 -0500
X-MC-Unique: qMEGhumEPW2DHNwxxx6H4Q-1
Received: by mail-pj1-f45.google.com with SMTP id
	n15-20020a17090a160f00b001a75089daa3so5825953pja.1
	for <dm-devel@redhat.com>; Wed, 17 Nov 2021 09:23:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=B1Ni0fagjZGByTTcZKwa1vZXhbm3ZKX3g7qTKHJy/9Y=;
	b=Zv+pd1x8p0z1ky8dcDGAOxOFol1i2z/qOqZv39a89ABWheUHjIywRN5S4Vd6xqXTmg
	1xFXh5Gd5QLZxOunDRfkZqRc9AZwmpnKuooBJrsY6nKeHxVBQCtvXSuj3Elx7E9qLEP9
	aWc7amGygBJzumCDZH8O8w1C25timAryF8L705jifGHfke3h0lpIS6Y+vV4GW7UQJjbZ
	KOSHXpHV68EQ9DRC4B8LmM6njBjcIWSmcI0KGk78MjmTmVh2vLC/kjJUxFJ3j01jt0Ty
	JKYCO/QIcDyIS4Lw7WhweRxeFInUeI0IOkU/4bddfrOL/ZrGMhQM4Gz0WCHTXLcGo8sa
	/mSQ==
X-Gm-Message-State: AOAM531TkTJILnKjQoi4qBAsmMPPpCkCaKgOp4seCFT/FuYd9iVwNWge
	FrZSoY8xkY/+h8Q7muzVrWHrM7Q/fc8IXxNdLtP23g==
X-Google-Smtp-Source: ABdhPJxkIf4IjyDIAL/AOyg+wZo8KXg00Li3POnr9FoL4MtTk7+2uk0M9RLmtvaFQhBaLJ5ZjvKGrbUA1Og0jd55rz0=
X-Received: by 2002:a17:902:7fcd:b0:142:8ab3:ec0e with SMTP id
	t13-20020a1709027fcd00b001428ab3ec0emr56745818plb.4.1637169837229;
	Wed, 17 Nov 2021 09:23:57 -0800 (PST)
MIME-Version: 1.0
References: <20211109083309.584081-1-hch@lst.de>
	<20211109083309.584081-3-hch@lst.de>
In-Reply-To: <20211109083309.584081-3-hch@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 17 Nov 2021 09:23:44 -0800
Message-ID: <CAPcyv4iPOcD8OsimpSZMnbTEsGZKj-GqSY=cWC0tPvoVs6DE1Q@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: dm-devel@redhat.com
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>, Mike Snitzer <snitzer@redhat.com>,
	linux-s390 <linux-s390@vger.kernel.org>, linux-erofs@lists.ozlabs.org,
	virtualization@lists.linux-foundation.org,
	linux-xfs <linux-xfs@vger.kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-ext4 <linux-ext4@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>
Subject: Re: [dm-devel] [PATCH 02/29] dm: make the DAX support dependend on
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 9, 2021 at 12:33 AM Christoph Hellwig <hch@lst.de> wrote:
>
> The device mapper DAX support is all hanging off a block device and thus
> can't be used with device dax.  Make it depend on CONFIG_FS_DAX instead
> of CONFIG_DAX_DRIVER.  This also means that bdev_dax_pgoff only needs to
> be built under CONFIG_FS_DAX now.
>

Applied, fixed the spelling of 'dependent' in the subject and picked
up Mike's Ack from the previous send:

https://lore.kernel.org/r/YYASBVuorCedsnRL@redhat.com

Christoph, any particular reason you did not pick up the tags from the
last posting?

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

