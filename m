Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 96C5023BC53
	for <lists+dm-devel@lfdr.de>; Tue,  4 Aug 2020 16:37:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596551843;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=us+l+osF9vcmfa4u02ywGNmrCynzmAfU2gCfo4RCm8Q=;
	b=StnUftHbcDn/Ua3QorjGo6Pah10DNcVL2tI9Ccx2kQlWEb2z5sjzbCpSJTUrGIUlTb6A1T
	3VhUVlb1B5S6K1B3EQIC/5dBVjDxMEe82jRm/IUK/aXn2F9RAv8xsvVBMh13sziwG6v6Ls
	ahtIS1j8NaeTBdsFQWtZI0/b6VAikJE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-thyEPqgmOXmk8dsGF7yiTg-1; Tue, 04 Aug 2020 10:37:20 -0400
X-MC-Unique: thyEPqgmOXmk8dsGF7yiTg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 586C61015DAC;
	Tue,  4 Aug 2020 14:37:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE85F2DE60;
	Tue,  4 Aug 2020 14:37:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F0BFAA35B2;
	Tue,  4 Aug 2020 14:36:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 074EaTfa012612 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 4 Aug 2020 10:36:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7D97871791; Tue,  4 Aug 2020 14:36:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1825C7179F;
	Tue,  4 Aug 2020 14:36:25 +0000 (UTC)
Date: Tue, 4 Aug 2020 10:36:25 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
Message-ID: <20200804143625.GA14672@redhat.com>
References: <20200804092501.7938-1-johannes.thumshirn@wdc.com>
	<CY4PR04MB3751EB538B7F29FBDBB4EBA4E74A0@CY4PR04MB3751.namprd04.prod.outlook.com>
	<SN4PR0401MB3598A9D49399D70697DCEC789B4A0@SN4PR0401MB3598.namprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <SN4PR0401MB3598A9D49399D70697DCEC789B4A0@SN4PR0401MB3598.namprd04.prod.outlook.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Naohiro Aota <Naohiro.Aota@wdc.com>,
	Damien Le Moal <Damien.LeMoal@wdc.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] dm: don't call report zones for more than the user
	requested
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Aug 04 2020 at  7:26am -0400,
Johannes Thumshirn <Johannes.Thumshirn@wdc.com> wrote:

> On 04/08/2020 12:17, Damien Le Moal wrote:
> > 
> > Looks good. I think this needs a Cc: stable.
> 
> Indeed, Mike can you add these two when applying or do you want me to resend?
> 
> Fixes: d41003513e61 ("block: rework zone reporting")
> Cc: stable@vger.kernel.org # v5.5+

I can apply those tags, thanks.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

