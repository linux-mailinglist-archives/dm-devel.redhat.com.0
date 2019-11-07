Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 81C2BF303D
	for <lists+dm-devel@lfdr.de>; Thu,  7 Nov 2019 14:43:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573134230;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qoW8r601YKsfyKwE3w/htRsR9g7k+b7WA44zJZJvTvI=;
	b=DUOflBkiOmIHXHsW/mfK/0M0emE5sst5Is3FMHXls23ODG45OB+GWnl04E+CjGkCFaUYfm
	MAx5ETmBLHASLePCM5utZQO+JEebtEBGxBkqrcpzFjpusZJLrmfi/V/rS01JGFXdskbUdL
	q9jMeHyzTQ1bPKBGbh1+/uLEIsUaWzM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-qrx7TGZUOIqthAnYI1hCWQ-1; Thu, 07 Nov 2019 08:43:47 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6FDC1005500;
	Thu,  7 Nov 2019 13:43:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B3D31001DE0;
	Thu,  7 Nov 2019 13:43:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DD7321832DEA;
	Thu,  7 Nov 2019 13:43:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA7DeSPf026435 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 7 Nov 2019 08:40:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C2A1B5DA76; Thu,  7 Nov 2019 13:40:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BABC95DA32
	for <dm-devel@redhat.com>; Thu,  7 Nov 2019 13:40:25 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4F8287C0A7
	for <dm-devel@redhat.com>; Thu,  7 Nov 2019 13:40:22 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id o9so1478516plk.6
	for <dm-devel@redhat.com>; Thu, 07 Nov 2019 05:40:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=4jwWug07MWOkr2qYik00IBFcec60QuuQYmHGTX5Nfvk=;
	b=JlT34mmsI4J54iPUTW2IHfEckqMhgJvzaCipHwdUQdf+8SuLGbaouS64T47b1v544b
	cO0dshXJPnpnBeNZmU2B5Kqg2wZMZbo1D+Ox29PFzid+yAp+niVPIlEGC6hlciqvEnpx
	A3ylZKzNz62AmiSQ5b6ZlsBDKBpr+TTPFvkNK9h/RVFSW6mwOIs6b+XtHIvrEzUJp/vb
	GQjrkDJn/zWW79W/SiC1wEvBS4r/Ut/MLFPig6TdE5+yDojq692bEm0KiMimYjt/psR1
	PJ/5wTx7UhAIJqhu3h/5X8d2SdDoylidcGCTBKNTRIZamouiSPvoeM7Z7iwXTcS6cEsu
	k/wA==
X-Gm-Message-State: APjAAAWFJLkOhuOLsiSGgbbhY9BasOfMyCPGoIcC6GTb8VYzIPHhod/I
	0C+/aZ99Yqk/ZCXTykK+WF1PKg==
X-Google-Smtp-Source: APXvYqxUqwziIRejg0VlHTo/IjAZ8qKz+Umil4abg66UwevSjmyaJOge6jJD9qFWjmRFk+eqOImpbg==
X-Received: by 2002:a17:902:47:: with SMTP id 65mr3722636pla.94.1573134021445; 
	Thu, 07 Nov 2019 05:40:21 -0800 (PST)
Received: from [192.168.1.188] ([66.219.217.79])
	by smtp.gmail.com with ESMTPSA id
	r11sm2255570pjp.14.2019.11.07.05.40.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Nov 2019 05:40:20 -0800 (PST)
To: Damien Le Moal <damien.lemoal@wdc.com>, linux-block@vger.kernel.org,
	linux-scsi@vger.kernel.org, "Martin K . Petersen"
	<martin.petersen@oracle.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
References: <20191027140549.26272-1-damien.lemoal@wdc.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <31755ade-ae21-8842-05c0-47017cea7e29@kernel.dk>
Date: Thu, 7 Nov 2019 06:40:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191027140549.26272-1-damien.lemoal@wdc.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 07 Nov 2019 13:40:22 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Thu, 07 Nov 2019 13:40:22 +0000 (UTC) for IP:'209.85.214.194'
	DOMAIN:'mail-pl1-f194.google.com'
	HELO:'mail-pl1-f194.google.com' FROM:'axboe@kernel.dk' RCPT:''
X-RedHat-Spam-Score: 0.002  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.214.194 mail-pl1-f194.google.com 209.85.214.194
	mail-pl1-f194.google.com <axboe@kernel.dk>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>, Keith Busch <kbusch@kernel.org>,
	Hans Holmberg <Hans.Holmberg@wdc.com>, Ajay Joshi <ajay.joshi@wdc.com>,
	Matias Bjorling <matias.bjorling@wdc.com>
Subject: Re: [dm-devel] [PATCH 0/8] Zone management commands support
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
X-MC-Unique: qrx7TGZUOIqthAnYI1hCWQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/27/19 8:05 AM, Damien Le Moal wrote:
> This series implements a few improvements and cleanups to zone block
> device zone reset operations with the first three patches.
> 
> The remaining of the series patches introduce zone open, close and
> finish support, allowing users of zoned block devices to explicitly
> control the condition (state) of zones.
> 
> While these operations are not stricktly necessary for the correct
> operation of zoned block devices, the open and close operations can
> improve performance for some device implementations of the ZBC and ZAC
> standards under write workloads. The finish zone operation, which
> transition a zone to the full state, can also be useful to protect a
> zone data by preventing further zone writes.
> 
> These operations are implemented by introducing the new
> REQ_OP_ZONE_OPEN, REQ_OP_ZONE_CLOSE and REQ_OP_ZONE_FINISH request codes
> and the function blkdev_zone_mgmt() to issue these requests. This new
> function also replaces the former blkdev_reset_zones() function to reset
> zones write pointer.
> 
> The new ioctls BLKOPENZONE, BLKCLOSEZONE and BLKFINISHZONE are also
> defined to allow applications to issue these new requests without
> resorting to a device passthrough interface (e.g. SG_IO).
> 
> Support for these operations is added to the SCSI sd driver, to the dm
> infrastructure (dm-linear and dm-flakey targets) and to the null_blk
> driver.

Applied for 5.5, thanks. I've got the last sd patch pending, the conflict
is rather ugly. I'll setup a post branch for drivers with this in, once
the dependent fix has landed in Linus's tree.

-- 
Jens Axboe

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

