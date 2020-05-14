Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 38F0D1D4018
	for <lists+dm-devel@lfdr.de>; Thu, 14 May 2020 23:33:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589492034;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=epraLtwYbaJmT/wqVVC6NFCVTmuDtADfV7cCyijIuYY=;
	b=OxWjVrnaw+1/ZmSZTQ4AdAPkHqIROsBMwhxKhW6Uz6Rd4kIWWTpXGZQCBJF9F7SRjm9xTa
	TN3RKu+zUlJARlGFop06aF8ypLwjCX4IkSAINPss5khw8MMzHGpR1ezR66C403ehemxMYr
	ylRO5tuHoDquYca6VPCp4bHXgHpKIXM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-hjaolNMBNwyQOG89FQOf2w-1; Thu, 14 May 2020 17:33:51 -0400
X-MC-Unique: hjaolNMBNwyQOG89FQOf2w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1B3D80183C;
	Thu, 14 May 2020 21:33:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0583C707D1;
	Thu, 14 May 2020 21:33:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AF9941809543;
	Thu, 14 May 2020 21:33:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04ELXUMZ013800 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 14 May 2020 17:33:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4F2826E6F2; Thu, 14 May 2020 21:33:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 52CC061547;
	Thu, 14 May 2020 21:33:27 +0000 (UTC)
Date: Thu, 14 May 2020 17:33:26 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: kbuild test robot <lkp@intel.com>
Message-ID: <20200514213326.GA661@redhat.com>
References: <202005150550.wsVhyFma%lkp@intel.com>
MIME-Version: 1.0
In-Reply-To: <202005150550.wsVhyFma%lkp@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, kbuild-all@lists.01.org
Subject: Re: [dm-devel] [dm:dm-5.8 55/57]
 include/linux/device-mapper.h:626:2: error: #endif without #if
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
Content-Disposition: inline

Sorry about that, now fixed.

On Thu, May 14 2020 at  5:15pm -0400,
kbuild test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git dm-5.8
> head:   2e374fada9514fe10561a41838a52dc05f0317b4
> commit: 6e1746c86200d4cd2562abe0a4b2892e3be04271 [55/57] dm: use dynamic debug instead of compile-time config option
> config: sh-allmodconfig (attached as .config)
> compiler: sh4-linux-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 6e1746c86200d4cd2562abe0a4b2892e3be04271
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day GCC_VERSION=9.3.0 make.cross ARCH=sh 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> In file included from drivers/md/dm.h:14,
> from drivers/md/dm-uevent.c:14:
> >> include/linux/device-mapper.h:626:2: error: #endif without #if
> 626 | #endif /* _LINUX_DEVICE_MAPPER_H */
> |  ^~~~~
> --
> In file included from drivers/md/dm.h:14,
> from drivers/md/dm-linear.c:7:
> >> include/linux/device-mapper.h:626:2: error: #endif without #if
> 626 | #endif /* _LINUX_DEVICE_MAPPER_H */
> |  ^~~~~
> In file included from drivers/md/dm-linear.c:14:
> >> include/linux/device-mapper.h:616:24: error: redefinition of 'to_sector'
> 616 | static inline sector_t to_sector(unsigned long long n)
> |                        ^~~~~~~~~
> In file included from drivers/md/dm.h:14,
> from drivers/md/dm-linear.c:7:
> include/linux/device-mapper.h:616:24: note: previous definition of 'to_sector' was here
> 616 | static inline sector_t to_sector(unsigned long long n)
> |                        ^~~~~~~~~
> In file included from drivers/md/dm-linear.c:14:
> >> include/linux/device-mapper.h:621:29: error: redefinition of 'to_bytes'
> 621 | static inline unsigned long to_bytes(sector_t n)
> |                             ^~~~~~~~
> In file included from drivers/md/dm.h:14,
> from drivers/md/dm-linear.c:7:
> include/linux/device-mapper.h:621:29: note: previous definition of 'to_bytes' was here
> 621 | static inline unsigned long to_bytes(sector_t n)
> |                             ^~~~~~~~
> In file included from drivers/md/dm-linear.c:14:
> >> include/linux/device-mapper.h:626:2: error: #endif without #if
> 626 | #endif /* _LINUX_DEVICE_MAPPER_H */
> |  ^~~~~
> --
> In file included from drivers/md/dm-snap.c:8:
> >> include/linux/device-mapper.h:626:2: error: #endif without #if
> 626 | #endif /* _LINUX_DEVICE_MAPPER_H */
> |  ^~~~~
> In file included from drivers/md/dm.h:14,
> from drivers/md/dm-snap.c:22:
> >> include/linux/device-mapper.h:616:24: error: redefinition of 'to_sector'
> 616 | static inline sector_t to_sector(unsigned long long n)
> |                        ^~~~~~~~~
> In file included from drivers/md/dm-snap.c:8:
> include/linux/device-mapper.h:616:24: note: previous definition of 'to_sector' was here
> 616 | static inline sector_t to_sector(unsigned long long n)
> |                        ^~~~~~~~~
> In file included from drivers/md/dm.h:14,
> from drivers/md/dm-snap.c:22:
> >> include/linux/device-mapper.h:621:29: error: redefinition of 'to_bytes'
> 621 | static inline unsigned long to_bytes(sector_t n)
> |                             ^~~~~~~~
> In file included from drivers/md/dm-snap.c:8:
> include/linux/device-mapper.h:621:29: note: previous definition of 'to_bytes' was here
> 621 | static inline unsigned long to_bytes(sector_t n)
> |                             ^~~~~~~~
> In file included from drivers/md/dm.h:14,
> from drivers/md/dm-snap.c:22:
> >> include/linux/device-mapper.h:626:2: error: #endif without #if
> 626 | #endif /* _LINUX_DEVICE_MAPPER_H */
> |  ^~~~~
> In file included from drivers/md/dm-exception-store.h:15,
> from drivers/md/dm-snap.c:24:
> >> include/linux/device-mapper.h:616:24: error: redefinition of 'to_sector'
> 616 | static inline sector_t to_sector(unsigned long long n)
> |                        ^~~~~~~~~
> In file included from drivers/md/dm.h:14,
> from drivers/md/dm-snap.c:22:
> include/linux/device-mapper.h:616:24: note: previous definition of 'to_sector' was here
> 616 | static inline sector_t to_sector(unsigned long long n)
> |                        ^~~~~~~~~
> In file included from drivers/md/dm-exception-store.h:15,
> from drivers/md/dm-snap.c:24:
> >> include/linux/device-mapper.h:621:29: error: redefinition of 'to_bytes'
> 621 | static inline unsigned long to_bytes(sector_t n)
> |                             ^~~~~~~~
> In file included from drivers/md/dm.h:14,
> from drivers/md/dm-snap.c:22:
> include/linux/device-mapper.h:621:29: note: previous definition of 'to_bytes' was here
> 621 | static inline unsigned long to_bytes(sector_t n)
> |                             ^~~~~~~~
> In file included from drivers/md/dm-exception-store.h:15,
> from drivers/md/dm-snap.c:24:
> >> include/linux/device-mapper.h:626:2: error: #endif without #if
> 626 | #endif /* _LINUX_DEVICE_MAPPER_H */
> |  ^~~~~
> --
> In file included from drivers/md/dm-zoned.h:13,
> from drivers/md/dm-zoned-metadata.c:8:
> >> include/linux/device-mapper.h:626:2: error: #endif without #if
> 626 | #endif /* _LINUX_DEVICE_MAPPER_H */
> |  ^~~~~
> drivers/md/dm-zoned-metadata.c: In function 'dmz_write_sb':
> drivers/md/dm-zoned-metadata.c:779:3: error: implicit declaration of function 'export_uuid' [-Werror=implicit-function-declaration]
> 779 |   export_uuid(sb->dmz_uuid, &zmd->uuid);
> |   ^~~~~~~~~~~
> drivers/md/dm-zoned-metadata.c: In function 'dmz_check_sb':
> drivers/md/dm-zoned-metadata.c:1015:3: error: implicit declaration of function 'import_uuid' [-Werror=implicit-function-declaration]
> 1015 |   import_uuid(&sb_uuid, sb->dmz_uuid);
> |   ^~~~~~~~~~~
> cc1: some warnings being treated as errors
> 
> vim +626 include/linux/device-mapper.h
> 
> 56a67df7660396 Mike Snitzer      2010-08-12  615  
> 0bdb50c531f737 NeilBrown         2019-01-06 @616  static inline sector_t to_sector(unsigned long long n)
> 0da336e5fab75c Alasdair G Kergon 2008-04-24  617  {
> 0da336e5fab75c Alasdair G Kergon 2008-04-24  618  	return (n >> SECTOR_SHIFT);
> 0da336e5fab75c Alasdair G Kergon 2008-04-24  619  }
> 0da336e5fab75c Alasdair G Kergon 2008-04-24  620  
> 0da336e5fab75c Alasdair G Kergon 2008-04-24 @621  static inline unsigned long to_bytes(sector_t n)
> 0da336e5fab75c Alasdair G Kergon 2008-04-24  622  {
> 0da336e5fab75c Alasdair G Kergon 2008-04-24  623  	return (n << SECTOR_SHIFT);
> 0da336e5fab75c Alasdair G Kergon 2008-04-24  624  }
> 0da336e5fab75c Alasdair G Kergon 2008-04-24  625  
> ^1da177e4c3f41 Linus Torvalds    2005-04-16 @626  #endif	/* _LINUX_DEVICE_MAPPER_H */
> 
> :::::: The code at line 626 was first introduced by commit
> :::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2
> 
> :::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
> :::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

