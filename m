Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C58F729AE12
	for <lists+dm-devel@lfdr.de>; Tue, 27 Oct 2020 14:56:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603806974;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IdfMG3w2rOh7DZulmnF8ErFpB8sYNO23HN7H4JIlPw4=;
	b=QGyUdX1QF+Enx3ZdeyMiPZedoC10TU10E4+8X3BGWEoRSeYdU7kgL7PNUP1iuGMQ/i7Pm2
	tEGqHvmwv7qw0KZUD61cIaFdLhKx584zxq5ru9nEycp7Hju3dhwB1kH87ZpEuiBxqKFg+y
	PAFTndpS82JC1/f2+lwsxsv3XhyzjGg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-1sewAXvlMwaNa6QosfK3qA-1; Tue, 27 Oct 2020 09:56:11 -0400
X-MC-Unique: 1sewAXvlMwaNa6QosfK3qA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B0F381EE71;
	Tue, 27 Oct 2020 13:55:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37DA45B4BC;
	Tue, 27 Oct 2020 13:55:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 87F9F181A06B;
	Tue, 27 Oct 2020 13:55:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09RDtZUH029133 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 27 Oct 2020 09:55:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B51E655762; Tue, 27 Oct 2020 13:55:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 341AF55773;
	Tue, 27 Oct 2020 13:55:32 +0000 (UTC)
Date: Tue, 27 Oct 2020 08:55:06 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Mike Christie <michael.christie@oracle.com>
Message-ID: <20201027125506.GB13012@redhat.com>
References: <1603412870-3627-1-git-send-email-michael.christie@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1603412870-3627-1-git-send-email-michael.christie@oracle.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 1/1] dm mpath: add IO affinity path selector
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 22 2020 at  8:27pm -0400,
Mike Christie <michael.christie@oracle.com> wrote:

> This patch adds a path selector that selects paths based on a CPU to
> path mapping the user passes in and what CPU we are executing on. The
> primary user for this PS is where the app is optimized to use specific
> CPUs so other PSs undo the apps handy work, and the storage and it's
> transport are not a bottlneck.
> 
> For these io-affinity PS setups a path's transport/interconnect
> perf is not going to flucuate a lot and there is no major differences
> between paths, so QL/HST smarts do not help and RR always messes up
> what the app is trying to do.
> 
> On a system with 16 cores, where you have a job per CPU:
> 
> fio --filename=/dev/dm-0 --direct=1 --rw=randrw --bs=4k \
> --ioengine=libaio --iodepth=128 --numjobs=16
> 
> and a dm-multipath device setup where each CPU is mapped to one path:
> 
> // When in mq mode I had to set dm_mq_nr_hw_queues=$NUM_PATHS.

OK, the modparam was/is a means to an end but the default of 1 is very
limiting (especially in that it becomes one-size-fits-all, which isn't
true, for all dm-multipath devices in the system).

If you have any ideas for what a sane heuristic would be for
dm_mq_nr_hw_queues I'm open to suggestions.  But DM target <-> DM core
<-> early block core interface coordination is "fun". ;)

> // Bio mode also showed similar results.
> 0 16777216 multipath 0 0 1 1 io-affinity 0 16 1 8:16 1 8:32 2 8:64 4
> 8:48 8 8:80 10 8:96 20 8:112 40 8:128 80 8:144 100 8:160 200 8:176
> 400 8:192 800 8:208 1000 8:224 2000 8:240 4000 65:0 8000
> 
> we can see a IOPs increase of 25%.

Great. What utility/code are you using to extract the path:cpu affinity?
Is it array specific?  Which hardware pins IO like this?

Will you, or others, be enhancing multipath-tools to allow passing such
io-affinity DM multipath tables?

> The percent increase depends on the device and interconnect. For a
> slower/medium speed path/device that can do around 180K IOPs a path
> if you ran that fio command to it directly we saw a 25% increase like
> above. Slower path'd devices that could do around 90K per path showed
> maybe around a 2 - 5% increase. If you use something like null_blk or
> scsi_debug which can multi-million IOPs and hack it up so each device
> they export shows up as a path then you see 50%+ increases.
> 
> Signed-off-by: Mike Christie <michael.christie@oracle.com>
> ---
>  drivers/md/Kconfig          |   9 ++
>  drivers/md/Makefile         |   1 +
>  drivers/md/dm-io-affinity.c | 272 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 282 insertions(+)
>  create mode 100644 drivers/md/dm-io-affinity.c
> 
> diff --git a/drivers/md/Kconfig b/drivers/md/Kconfig
> index 30ba357..c82d8b6 100644
> --- a/drivers/md/Kconfig
> +++ b/drivers/md/Kconfig
> @@ -463,6 +463,15 @@ config DM_MULTIPATH_HST
>  
>  	  If unsure, say N.
>  
> +config DM_MULTIPATH_IOA
> +	tristate "I/O Path Selector based on CPU submission"
> +	depends on DM_MULTIPATH
> +	help
> +	  This path selector selects the path based on the CPU the IO is
> +	  executed on and the CPU to path mapping setup at path addition time.
> +
> +	  If unsure, say N.
> +
>  config DM_DELAY
>  	tristate "I/O delaying target"
>  	depends on BLK_DEV_DM
> diff --git a/drivers/md/Makefile b/drivers/md/Makefile
> index 6d3e234..4f95f33 100644
> --- a/drivers/md/Makefile
> +++ b/drivers/md/Makefile
> @@ -59,6 +59,7 @@ obj-$(CONFIG_DM_MULTIPATH)	+= dm-multipath.o dm-round-robin.o
>  obj-$(CONFIG_DM_MULTIPATH_QL)	+= dm-queue-length.o
>  obj-$(CONFIG_DM_MULTIPATH_ST)	+= dm-service-time.o
>  obj-$(CONFIG_DM_MULTIPATH_HST)	+= dm-historical-service-time.o
> +obj-$(CONFIG_DM_MULTIPATH_IOA)	+= dm-io-affinity.o
>  obj-$(CONFIG_DM_SWITCH)		+= dm-switch.o
>  obj-$(CONFIG_DM_SNAPSHOT)	+= dm-snapshot.o
>  obj-$(CONFIG_DM_PERSISTENT_DATA)	+= persistent-data/

Thinking about renaming all PS files to have a dm-ps prefix...

Fact that we have dm-io.c makes dm-io-affinity.c all the more confusing.

Can you rename to dm-ps-io-affinity.c and post v2?

(Code looks good, pretty simple)

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

