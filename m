Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id F1FE4E2C33
	for <lists+dm-devel@lfdr.de>; Thu, 24 Oct 2019 10:31:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571905878;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QqCON6JxQX++nTejAUo3fNUBsQ2jeHq3ypZ5+muen5E=;
	b=JYWDN+vAhiu7Bf5L2RbPb8P5nOO/5qgNwFrgZGiMgF0oPfOq8EqEkLOJu+eGqjklFJkMOA
	ySa7R4cTDrOFTvk8MKEmSbqADyqR3iPAESTj14R84rhvEItFtwkaNQqgY3bqyMQoh3fv4z
	MgIHqnec57SdqkFjLkdrChxaOSdqbgU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-GQiUbiUFPL-dQVFtyhxeSQ-1; Thu, 24 Oct 2019 04:31:16 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5206F107AD31;
	Thu, 24 Oct 2019 08:31:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 320575D6D0;
	Thu, 24 Oct 2019 08:31:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 896E94E58B;
	Thu, 24 Oct 2019 08:31:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9O7Kj0w015008 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Oct 2019 03:20:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 74107600CC; Thu, 24 Oct 2019 07:20:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx28.extmail.prod.ext.phx2.redhat.com
	[10.5.110.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F051A600C4;
	Thu, 24 Oct 2019 07:20:40 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5EAE58AC6F7;
	Thu, 24 Oct 2019 07:20:39 +0000 (UTC)
Received: from redsun51.ssa.fujisawa.hgst.com (unknown [199.255.47.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id CF5C420684;
	Thu, 24 Oct 2019 07:20:37 +0000 (UTC)
Date: Thu, 24 Oct 2019 16:20:31 +0900
From: Keith Busch <kbusch@kernel.org>
To: Damien Le Moal <damien.lemoal@wdc.com>
Message-ID: <20191024072031.GA29028@redsun51.ssa.fujisawa.hgst.com>
References: <20191024065006.8684-1-damien.lemoal@wdc.com>
	<20191024065006.8684-2-damien.lemoal@wdc.com>
MIME-Version: 1.0
In-Reply-To: <20191024065006.8684-2-damien.lemoal@wdc.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.69]);
	Thu, 24 Oct 2019 07:20:39 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.69]);
	Thu, 24 Oct 2019 07:20:39 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'kbusch@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.101  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<kbusch@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.69
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 24 Oct 2019 04:29:52 -0400
Cc: Jens Axboe <axboe@kernel.dk>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Mike Snitzer <snitzer@redhat.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, linux-scsi@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 1/4] block: Enhance
	blk_revalidate_disk_zones()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: GQiUbiUFPL-dQVFtyhxeSQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thu, Oct 24, 2019 at 03:50:03PM +0900, Damien Le Moal wrote:
> -=09/* Do a report zone to get max_lba and the same field */
> -=09ret =3D sd_zbc_do_report_zones(sdkp, buf, bufsize, 0, false);
> +=09/* Do a report zone to get max_lba and the size of the first zone */
> +=09ret =3D sd_zbc_do_report_zones(sdkp, buf, SD_BUF_SIZE, 0, false);

This is no longer reading all the zones here, so you could set the
'partial' field to true. And then since this was the only caller that
had set partial to false, you can also remove that parameter.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

