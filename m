Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 1C6EC201595
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 18:29:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592584173;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4Zz5Qv8RbByFYVcwqrN8Ix84uKoRlOioAb9KLCI/4J0=;
	b=ChvoKekBWNY0pN/Ln8hGJ4m/0clnxJT1hSUszNEhf0MbAMGwURiDpwAYoL8NBYJsAFIHYi
	PdmEW8Vq2iT53BsV/u4Jy0pnSEPGtM4JnHz5aNpSYa38jU2ha7SqCLl7OXpETeya7/BZaX
	Fjyxg5COsfIWeFWm8+4MaYYkNQCz33M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-lmtQgQs7PKilWwxNFfeaew-1; Fri, 19 Jun 2020 12:29:30 -0400
X-MC-Unique: lmtQgQs7PKilWwxNFfeaew-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF59319200C3;
	Fri, 19 Jun 2020 16:29:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BF9E19D7B;
	Fri, 19 Jun 2020 16:29:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DC6DE1809543;
	Fri, 19 Jun 2020 16:29:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05JGR361026479 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 12:27:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4AEC25D9F1; Fri, 19 Jun 2020 16:27:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2042D5D9EF;
	Fri, 19 Jun 2020 16:27:00 +0000 (UTC)
Date: Fri, 19 Jun 2020 12:26:59 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <20200619162658.GB24642@redhat.com>
References: <20200619065905.22228-1-johannes.thumshirn@wdc.com>
	<20200619065905.22228-3-johannes.thumshirn@wdc.com>
	<CY4PR04MB37514CDC42E7F545244D66C6E7980@CY4PR04MB3751.namprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <CY4PR04MB37514CDC42E7F545244D66C6E7980@CY4PR04MB3751.namprd04.prod.outlook.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Naohiro Aota <Naohiro.Aota@wdc.com>
Subject: Re: [dm-devel] [RFC PATCH 2/2] dm: don't try to split
	REQ_OP_ZONE_APPEND bios
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Jun 19 2020 at  3:54am -0400,
Damien Le Moal <Damien.LeMoal@wdc.com> wrote:

> On 2020/06/19 15:59, Johannes Thumshirn wrote:
> > REQ_OP_ZONE_APPEND bios cannot be split so return EIO if we can't fit it
> > into one IO.
> > 
> > Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
> > ---
> >  drivers/md/dm.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> > index 058c34abe9d1..c720a7e3269a 100644
> > --- a/drivers/md/dm.c
> > +++ b/drivers/md/dm.c
> > @@ -1609,6 +1609,9 @@ static int __split_and_process_non_flush(struct clone_info *ci)
> >  
> >  	len = min_t(sector_t, max_io_len(ci->sector, ti), ci->sector_count);
> >  
> > +	if (bio_op(ci->bio) == REQ_OP_ZONE_APPEND && len < ci->sector_count)
> > +		return -EIO;
> > +
> >  	r = __clone_and_map_data_bio(ci, ti, ci->sector, &len);
> >  	if (r < 0)
> >  		return r;
> > 
> 
> I think this is OK. The stacked max_zone_append_sectors limit should have
> prevented that to happen  in the first place I think, but better safe than sorry.
> 
> Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

If stacked max_zone_append_sectors limit should prevent it then I'd
rather not sprinkle more zoned specific checks in DM core.

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

