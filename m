Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id EAD0D26D49F
	for <lists+dm-devel@lfdr.de>; Thu, 17 Sep 2020 09:25:56 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-wO1r8vZdMcaP4aw4I9WJcA-1; Thu, 17 Sep 2020 03:25:54 -0400
X-MC-Unique: wO1r8vZdMcaP4aw4I9WJcA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D088685B67E;
	Thu, 17 Sep 2020 07:25:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ACE884D;
	Thu, 17 Sep 2020 07:25:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5F9B744A74;
	Thu, 17 Sep 2020 07:25:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08G9hmEX009291 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 16 Sep 2020 05:43:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 48CC92028E91; Wed, 16 Sep 2020 09:43:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 416B72026F94
	for <dm-devel@redhat.com>; Wed, 16 Sep 2020 09:43:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E56EE185A78B
	for <dm-devel@redhat.com>; Wed, 16 Sep 2020 09:43:45 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-494-SnE5nT6tPHCZzpH17QS0qA-1;
	Wed, 16 Sep 2020 05:43:44 -0400
X-MC-Unique: SnE5nT6tPHCZzpH17QS0qA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 5A4AFABD1;
	Wed, 16 Sep 2020 09:29:37 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
	id 0C0D8DA7C7; Wed, 16 Sep 2020 11:28:09 +0200 (CEST)
Date: Wed, 16 Sep 2020 11:28:09 +0200
From: David Sterba <dsterba@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200916092809.GJ1791@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz, Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>, Song Liu <song@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Richard Weinberger <richard@nod.at>,
	Minchan Kim <minchan@kernel.org>, linux-mtd@lists.infradead.org,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, drbd-dev@tron.linbit.com,
	linux-raid@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, cgroups@vger.kernel.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>
References: <20200910144833.742260-1-hch@lst.de>
	<20200910144833.742260-8-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200910144833.742260-8-hch@lst.de>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 17 Sep 2020 03:25:18 -0400
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>, Minchan Kim <minchan@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, cgroups@vger.kernel.org,
	drbd-dev@tron.linbit.com, linux-fsdevel@vger.kernel.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-mm@kvack.org
Subject: Re: [dm-devel] [PATCH 07/12] bdi: remove BDI_CAP_CGROUP_WRITEBACK
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: dsterba@suse.cz
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Sep 10, 2020 at 04:48:27PM +0200, Christoph Hellwig wrote:
> Just checking SB_I_CGROUPWB for cgroup writeback support is enough.
> Either the file system allocates its own bdi (e.g. btrfs), in which case
> it is known to support cgroup writeback, or the bdi comes from the block
> layer, which always supports cgroup writeback.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Acked-by: David Sterba <dsterba@suse.com>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

