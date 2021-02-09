Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 12A513150D3
	for <lists+dm-devel@lfdr.de>; Tue,  9 Feb 2021 14:52:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612878726;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=l4jbvNe5kr6KqJzH32o5gz1w73usR6QOLhrITkAgAkk=;
	b=inNglRZAID9FDv2STS0d4R9eMvILNpwvJjPDpQh28FGNYWe1cdAh+sFzjpgivTRDr/YCAQ
	XUVtqIaNWh3p5r06ZjJR14oQ+eZGxl1CSiRRTyr35IJL7y5QC2JfZHCfHlpFrFIOTH6mjW
	LTP9rGWbNWA0KHgC6jTKPv9FSrpj7w0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-AmITIrzQMeKwXAA7zyRbXw-1; Tue, 09 Feb 2021 08:52:03 -0500
X-MC-Unique: AmITIrzQMeKwXAA7zyRbXw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BB6A100CCC1;
	Tue,  9 Feb 2021 13:51:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6ACFA60CD2;
	Tue,  9 Feb 2021 13:51:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D209318095CB;
	Tue,  9 Feb 2021 13:51:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 119DpTad023008 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 9 Feb 2021 08:51:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9606B60C61; Tue,  9 Feb 2021 13:51:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B56E60C04;
	Tue,  9 Feb 2021 13:51:25 +0000 (UTC)
Date: Tue, 9 Feb 2021 08:51:25 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: JeffleXu <jefflexu@linux.alibaba.com>
Message-ID: <20210209135125.GA1548@redhat.com>
References: <20210202033528.76166-1-jefflexu@linux.alibaba.com>
	<20210205183909.GA4722@redhat.com>
	<59ca57e0-5a5f-33b6-24ed-90d615c40949@linux.alibaba.com>
	<20210208151700.GA22064@redhat.com>
	<20210209052959.GA25714@redhat.com>
	<cdecf30e-cb66-a1cc-b7e0-749953af1e19@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <cdecf30e-cb66-a1cc-b7e0-749953af1e19@linux.alibaba.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: joseph.qi@linux.alibaba.com, msb@chromium.org, dm-devel@redhat.com,
	toshi.kani@hpe.com, mbroz@redhat.com
Subject: Re: [dm-devel] dm: fix iterate_device sanity check
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 09 2021 at  2:06am -0500,
JeffleXu <jefflexu@linux.alibaba.com> wrote:

> 
> 
> On 2/9/21 1:29 PM, Mike Snitzer wrote:
> > 
> > Hi, please see these commits that I've staged in linux-next via:
> > https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/log/?h=for-next
> > 
> > 1141b9133777 dm table: fix iterate_devices based device capability checks
> > 0224c5e6fd07 dm table: fix DAX iterate_devices based device capability checks
> > 76b0e14be03f dm table: fix zoned iterate_devices based device capability checks
> > 55cdd7435e97 dm table: remove needless request_queue NULL pointer checks
> > 
> 
> Thanks. This series looks good to me.
> 
> I suddenly find that the semantics of patch 1 (1141b9133777 dm table:
> fix iterate_devices based device capability checks) is a little
> different with the original context.
> 
> -	if (blk_queue_add_random(q) && dm_table_all_devices_attribute(t,
> device_is_not_random))
> +	if (dm_table_any_dev_attr(t, device_is_not_random))
>  		blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, q);
> +	else
> +		blk_queue_flag_set(QUEUE_FLAG_ADD_RANDOM, q);
> 
> In the original context, QUEUE_FLAG_ADD_RANDOM will only be cleared, it
> won't be set, while it could be set after patch 1. But I could see no
> harm of setting QUEUE_FLAG_ADD_RANDOM flag though.
> 
> FYI. Currently only scsi devices are still using QUEUE_FLAG_ADD_RANDOM
> flag, as all non-rotational devices should not set this flag since
> commit b277da0a8a59 ("block: disable entropy contributions for nonrot
> devices").

I fixed it, thanks.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

