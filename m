Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3F58128AFA9
	for <lists+dm-devel@lfdr.de>; Mon, 12 Oct 2020 10:09:19 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-1vn8EmnTPA-zgXTehMQxJw-1; Mon, 12 Oct 2020 04:09:15 -0400
X-MC-Unique: 1vn8EmnTPA-zgXTehMQxJw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3865A803F4D;
	Mon, 12 Oct 2020 08:09:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 178D776666;
	Mon, 12 Oct 2020 08:09:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 581A4181A06E;
	Mon, 12 Oct 2020 08:09:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 098K647S020497 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 8 Oct 2020 16:06:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EBB55207A644; Thu,  8 Oct 2020 20:06:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E4A642049CB7
	for <dm-devel@redhat.com>; Thu,  8 Oct 2020 20:06:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8CF3518AE941
	for <dm-devel@redhat.com>; Thu,  8 Oct 2020 20:06:01 +0000 (UTC)
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-197--YNajpzBPxmnH20D9Y59BA-1; Thu, 08 Oct 2020 16:05:59 -0400
X-MC-Unique: -YNajpzBPxmnH20D9Y59BA-1
Received: by mail-io1-f65.google.com with SMTP id k25so7706532ioh.7
	for <dm-devel@redhat.com>; Thu, 08 Oct 2020 13:05:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xwsDN6X1qdoLg6NoAWCRmcDuaBAzrQD/adalLvAVzBM=;
	b=k/TsIyZoTisa2vURRvPaMGWUeyetGdWq1fnUE0HpjfoI8iREBsOp0yP6+oM3p4VJyO
	pvW9YSnmURkiLCPXlsj3xZOtH1jbGD7Gpi1ixa3zhRYf77EsEYvDbrJMbO8yQtGxWjdT
	dX9rdO0jCGedEMiulh+d9RgHiVVZYC6X9EF/rnwsrK1xtxnv1ECA37TrfB5MfvVB47ti
	iAHbq5Wg8TQ75+6c9PKaoo+LryIRT6p8UiL5iCSZmkvBAdj6RZXtUsxAmpioIMNuNgTw
	Md5qBRn9u4ppDofBSJ+KpgFR5/g7Ok8oFrNFmrsMYeRDZy6aAp8f12AvXDThQzVonQSq
	73aA==
X-Gm-Message-State: AOAM531uZrHOsmbTmiVW2YpVXE5seHfzJ6iZoRpyT3akCL2lVmO9+xv+
	3vEYfXPImUkppCH6Tn55+Q+xh+r82F7ToVOS8EvCzQ==
X-Google-Smtp-Source: ABdhPJwRCRIfxkJxJDVD6dM9ZY7goLBzqf32rCpZ4VHK8YdlkCRXmoFRaE02yXNCdOUnFtWCNypXdYNx4H1pQRSz0+Q=
X-Received: by 2002:a02:a0c2:: with SMTP id i2mr8174613jah.92.1602187558626;
	Thu, 08 Oct 2020 13:05:58 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYtwisRJtN4ht=ApeWc1jWssDok-7y2wee6Z0kzMP-atKg@mail.gmail.com>
In-Reply-To: <CA+G9fYtwisRJtN4ht=ApeWc1jWssDok-7y2wee6Z0kzMP-atKg@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 9 Oct 2020 01:35:47 +0530
Message-ID: <CA+G9fYseTYRWoHUNZ=j4mjFs9dDJ-KOD8hDy+RnyDPx75HcVWw@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>, dm-devel@redhat.com,
	open list <linux-kernel@vger.kernel.org>,
	linux-block <linux-block@vger.kernel.org>, drbd-dev@tron.linbit.com,
	"open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)"
	<linux-ide@vger.kernel.org>, 
	linux-raid@vger.kernel.org, linux-mmc <linux-mmc@vger.kernel.org>,
	Linux-Next Mailing List <linux-next@vger.kernel.org>,
	lkft-triage@lists.linaro.org
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 12 Oct 2020 04:08:26 -0400
Cc: Jens Axboe <axboe@kernel.dk>, Stephen Rothwell <sfr@canb.auug.org.au>,
	Ulf Hansson <ulf.hansson@linaro.org>, martin.petersen@oracle.com,
	Song Liu <song@kernel.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 8 Oct 2020 at 23:41, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> There are two major regressions noticed on linux next tag 20201008.
> I will bisect this problem and get back to you.

Reverting scsi: patch set on  linux next tag 20201008 fixed reported problems.
git revert --no-edit 653eb7c99d84..ed7fb2d018fd


>
> 1) qemu_i386 and qemu_x86 boot failed due to mount rootfs failing [1].
>
>         Starting Remount Root and Kernel File Systems...
> [    1.750740] ata1.00: WARNING: zero len r/w req
> [    1.751423] ata1.00: WARNING: zero len r/w req
> [    1.752361] ata1.00: WARNING: zero len r/w req
> [    1.753400] ata1.00: WARNING: zero len r/w req
> [    1.754447] ata1.00: WARNING: zero len r/w req
> [    1.755529] ata1.00: WARNING: zero len r/w req
> [    1.756630] sd 0:0:0:0: [sda] tag#0 FAILED Result:
> hostbyte=DID_ERROR driverbyte=DRIVER_OK cmd_age=0s
> [    1.758622] sd 0:0:0:0: [sda] tag#0 CDB: Synchronize Cache(10) 35
> 00 00 00 00 00 00 00 00 00
> [    1.760576] blk_update_request: I/O error, dev sda, sector 0 op
> 0x1:(WRITE) flags 0x800 phys_seg 1 prio class 0
> [    1.761534] Buffer I/O error on dev sda, logical block 0, lost sync
> page write
> [    1.764158] EXT4-fs (sda): I/O error while writing superblock
>
>
> 2) the devices boot pass but mkfs failed on x86_64, i386, arm64
> Juno-r2 devices [2].
>
> mkfs -t ext4 /dev/disk/by-id/ata-TOSHIBA_MG03ACA100_37O9KGL0F
> [   72.159789] ata3.00: WARNING: zero len r/w req
> [   72.164287] ata3.00: WARNING: zero len r/w req
> [   72.168774] ata3.00: WARNING: zero len r/w req
> [   72.168777] ata3.00: WARNING: zero len r/w req
> [   72.168779] ata3.00: WARNING: zero len r/w req
> [   72.168781] ata3.00: WARNING: zero len r/w req
> [   72.168786] sd 2:0:0:0: [sda] tag#5 FAILED Result:
> hostbyte=DID_ERROR driverbyte=DRIVER_OK cmd_age=0s
> [   72.168788] sd 2:0:0:0: [sda] tag#5 CDB: Synchronize Cache(10) 35
> 00 00 00 00 00 00 00 00 00
> [   72.168791] blk_update_request: I/O error, dev sda, sector 0 op
> 0x1:(WRITE) flags 0x800 phys_seg 0 prio class 0
>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
>
> metadata:
>   git branch: master
>   git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>   git commit: e4fb79c771fbe2e6fcb3cffa87d5823a9bbf3f10
>   git describe: next-20201008
>   make_kernelversion: 5.9.0-rc8
>   kernel-config:
> https://builds.tuxbuild.com/pOW-FELX2VUycejkuyiKZg/kernel.config
>
>
> steps to reproduce:
> --------------------------
> 1) qemu boot command:
>
> /usr/bin/qemu-system-x86_64 -cpu host -enable-kvm -nographic -net
> nic,model=virtio,macaddr=DE:AD:BE:EF:66:06 -net tap -m 1024 -monitor
> none -kernel bzImage --append "root=/dev/sda  rootwait
> console=ttyS0,115200" -hda
> rpb-console-image-lkft-intel-corei7-64-20200723162342-41.rootfs.ext4
> -m 4096 -smp 4 -nographic
>
> 2) boot x86_64 with linux next 20201008 tag kernel and attach SDD drive.
>
> mkfs -t ext4 /dev/<drive-partition>
>
> Full log links,
> [1 ]https://lkft.validation.linaro.org/scheduler/job/1823906#L688
> [2] https://lkft.validation.linaro.org/scheduler/job/1823938#L2065
>
>
> --
> Linaro LKFT
> https://lkft.linaro.org

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

