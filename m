Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5B24A287CF7
	for <lists+dm-devel@lfdr.de>; Thu,  8 Oct 2020 22:20:31 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-1l5Y90QtPEWvS0ngZqfZZw-1; Thu, 08 Oct 2020 16:20:27 -0400
X-MC-Unique: 1l5Y90QtPEWvS0ngZqfZZw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A16B5879534;
	Thu,  8 Oct 2020 20:20:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E4B11002C07;
	Thu,  8 Oct 2020 20:20:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 988FB1832FC1;
	Thu,  8 Oct 2020 20:19:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 098KHpmd021389 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 8 Oct 2020 16:17:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8575D12457A; Thu,  8 Oct 2020 20:17:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FEDC12457E
	for <dm-devel@redhat.com>; Thu,  8 Oct 2020 20:17:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3961818AE941
	for <dm-devel@redhat.com>; Thu,  8 Oct 2020 20:17:49 +0000 (UTC)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-188-WLnfprppMN2B5ceaSfY27Q-1; Thu, 08 Oct 2020 16:17:46 -0400
X-MC-Unique: WLnfprppMN2B5ceaSfY27Q-1
Received: by mail-pg1-f195.google.com with SMTP id g9so5269880pgh.8
	for <dm-devel@redhat.com>; Thu, 08 Oct 2020 13:17:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=mRwM0Y2OSmF79xkRQZ5J4gQg+TTvbMu62ytl+MfGImc=;
	b=TS6mgmcNYEIatV7U3pnLqvNbrrJ868b7E0QVXg1Fo6/0unafI9JG+n0kX+uYx+pNpa
	jWTrT60H3Nf7dJ8mFFzQyB3dkyagyav3jtt5Om2wWXH3IXlN6PX439FBwK7NF0LUrQA+
	v9j+uT5zKDC1RJfcVFjUP0UZph9ru4dRLbtcTTt+tDKXxl91IEu5XvEzl1zIzW14hjNh
	nXdLOBbGDpGtqZG/ap75+fJGgWVt7kW/JSvvYsGmEMV3kKH1FByhB7Hx1JuRyQBxqQ1P
	chs4z1XuIwIfYMdDeQXkcMN2KBP7cLt0tB5+H3hLoHUPHJp/Yr5+lDhx8783rG+z0od6
	DFWQ==
X-Gm-Message-State: AOAM533i96NfF/zJuLCuxsCeOcLb5s7uLSmlU3PwJ0IxZY9VUaAWQvs4
	5YIxO+6WjKX4/pzBApkS5l549A==
X-Google-Smtp-Source: ABdhPJyrEiJ103CqNMkdVeceuGn0jLX1sSjQCz00oPZplp/Qz9p0AFVypMlc6kEdUNyQiGypFdHH3Q==
X-Received: by 2002:a65:67d4:: with SMTP id b20mr493567pgs.245.1602188265462; 
	Thu, 08 Oct 2020 13:17:45 -0700 (PDT)
Received: from [192.168.1.134] ([66.219.217.173])
	by smtp.gmail.com with ESMTPSA id y4sm8963325pjc.53.2020.10.08.13.17.43
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 08 Oct 2020 13:17:44 -0700 (PDT)
To: Naresh Kamboju <naresh.kamboju@linaro.org>, Christoph Hellwig
	<hch@lst.de>, dm-devel@redhat.com,
	open list <linux-kernel@vger.kernel.org>,
	linux-block <linux-block@vger.kernel.org>, drbd-dev@tron.linbit.com,
	"open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)"
	<linux-ide@vger.kernel.org>,
	linux-raid@vger.kernel.org, linux-mmc <linux-mmc@vger.kernel.org>,
	Linux-Next Mailing List <linux-next@vger.kernel.org>,
	lkft-triage@lists.linaro.org
References: <CA+G9fYtwisRJtN4ht=ApeWc1jWssDok-7y2wee6Z0kzMP-atKg@mail.gmail.com>
	<CA+G9fYseTYRWoHUNZ=j4mjFs9dDJ-KOD8hDy+RnyDPx75HcVWw@mail.gmail.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <24c8ee4d-d5f7-e49f-cd0c-7cf50a5fd885@kernel.dk>
Date: Thu, 8 Oct 2020 14:17:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA+G9fYseTYRWoHUNZ=j4mjFs9dDJ-KOD8hDy+RnyDPx75HcVWw@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Song Liu <song@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
	martin.petersen@oracle.com, Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [dm-devel] [ Regressions ] linux next 20201008:
 blk_update_request: I/O error, dev sda,
 sector 0 op 0x1:(WRITE) flags 0x800 phys_seg 0 prio class 0
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
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/8/20 2:05 PM, Naresh Kamboju wrote:
> On Thu, 8 Oct 2020 at 23:41, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>>
>> There are two major regressions noticed on linux next tag 20201008.
>> I will bisect this problem and get back to you.
> 
> Reverting scsi: patch set on  linux next tag 20201008 fixed reported problems.
> git revert --no-edit 653eb7c99d84..ed7fb2d018fd

Just for everyones edification, that would be these 9 patches from the
SCSI tree:

Christoph Hellwig (9):
      scsi: core: Don't export scsi_device_from_queue()
      scsi: core: Remove scsi_init_cmd_errh
      scsi: core: Move command size detection out of the fast path
      scsi: core: Use rq_dma_dir in scsi_setup_cmnd()
      scsi: core: Rename scsi_prep_state_check() to scsi_device_state_check()
      scsi: core: Rename scsi_mq_prep_fn() to scsi_prepare_cmd()
      scsi: core: Clean up allocation and freeing of sgtables
      scsi: core: Remove scsi_setup_cmnd() and scsi_setup_fs_cmnd()
      scsi: core: Only start the request just before dispatching

-- 
Jens Axboe

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

