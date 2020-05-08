Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id ECF5A1CB50F
	for <lists+dm-devel@lfdr.de>; Fri,  8 May 2020 18:39:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588955947;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lfvM2FdMJI30xLosMRIL1FyAQxeb6SUl8RaV4Z+LqhI=;
	b=VAO+tdFy5SXwCccX7pKjkF4DQI9sf+9ieK60uVLbAURJsUCmagi/bwJyk+MxBh4hM6M4Va
	9bbLihwBK8OTB/k6LZO21zaOZOa3SesUKtBjhemwBeTAIhzRGAb1vDQ2l+kq63ddwRV27h
	+jBEGUGEBUPDKyPx4UlwFHGP/kxcWOE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-8i9cE9ScP-aGamPUlkQMzA-1; Fri, 08 May 2020 12:39:04 -0400
X-MC-Unique: 8i9cE9ScP-aGamPUlkQMzA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB280107ACF2;
	Fri,  8 May 2020 16:38:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A7FF70461;
	Fri,  8 May 2020 16:38:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A95771809543;
	Fri,  8 May 2020 16:38:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 048Gcm2e000754 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 8 May 2020 12:38:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E9D074DA22; Fri,  8 May 2020 16:38:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 088A05C1B0;
	Fri,  8 May 2020 16:38:45 +0000 (UTC)
Date: Fri, 8 May 2020 12:38:44 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Hannes Reinecke <hare@suse.de>
Message-ID: <20200508163844.GB18662@redhat.com>
References: <20200508090332.40716-1-hare@suse.de>
	<20200508090332.40716-15-hare@suse.de>
MIME-Version: 1.0
In-Reply-To: <20200508090332.40716-15-hare@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, Bob Liu <bob.liu@oracle.com>,
	dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 14/14] dm-zoned: metadata version 2
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, May 08 2020 at  5:03am -0400,
Hannes Reinecke <hare@suse.de> wrote:

> Implement handling for metadata version 2. The new metadata adds
> a label and UUID for the device mapper device, and additional UUID
> for the underlying block devices.
> It also allows for an additional regular drive to be used for
> emulating random access zones. The emulated zones will be placed
> logically in front of the zones from the zoned block device, causing
> the superblocks and metadata to be stored on that device.
> The first zone of the original zoned device will be used to hold
> another, tertiary copy of the metadata; this copy carries a
> generation number of 0 and is never updated; it's just used
> for identification.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> Reviewed-by: Bob Liu <bob.liu@oracle.com>

Noticing some changes layered ontop of what I expected (your previous
version + Damien's changes [1] folded in).

The changelog on the 0th header doesn't really speak to the changes I'm
seeing.  Is it worth enumerating them to ease incremental review?
Damien?

[1] https://www.redhat.com/archives/dm-devel/2020-April/msg00273.html

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

