Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDCEB3FE9
	for <lists+dm-devel@lfdr.de>; Mon, 16 Sep 2019 20:01:45 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E322B90B25;
	Mon, 16 Sep 2019 18:01:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A498E5C1D6;
	Mon, 16 Sep 2019 18:01:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D13D41803518;
	Mon, 16 Sep 2019 18:01:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8GI1H1x012447 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 16 Sep 2019 14:01:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B16C46012E; Mon, 16 Sep 2019 18:01:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F199A60126;
	Mon, 16 Sep 2019 18:01:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3D5B4302C07C;
	Mon, 16 Sep 2019 18:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rWFpC0PvFEUVsr2r3SRBHX+maJ7H1VL/XSUZCHn4eAo=;
	b=ndxcOCBaEO7SlV9r+k67ahLFO
	oqzJjpUB6eb6Wmu8A2l8Kt/tmXf26bfEztgwlZf+ZnMNvUYVsg21BDGAhPtdoAe6/QFIUd27+0qs2
	xUfcB2ElMzd3l0gqKfenisYQmWzk1x+mqJvh7Rcfuas+v8N1BspFgN8YboHyiwkrtnFx9IkKfBGVi
	1d8bwNwq6Bsq5PWWfOHLNNCH6PXGte4R3qNspc8dGs1Znfw+tZiPvfeVeHJfRaUT75DdMRyZiHuMf
	KP3FCoMybScIzGaQsqJ1JFE0wNQ3/NvLJC31v9wvbp8GGuUF/8kl4F+OYEzAHxZzVv6N57x07ru6b
	tmkiyd2dA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.2 #3 (Red
	Hat Linux)) id 1i9vJD-0000ZY-H7; Mon, 16 Sep 2019 18:01:07 +0000
Date: Mon, 16 Sep 2019 11:01:07 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20190916180107.GA725@infradead.org>
References: <alpine.LRH.2.02.1909160553360.11421@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.02.1909160553360.11421@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.46]); Mon, 16 Sep 2019 18:01:08 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Mon, 16 Sep 2019 18:01:08 +0000 (UTC) for IP:'198.137.202.133'
	DOMAIN:'bombadil.infradead.org' HELO:'bombadil.infradead.org'
	FROM:'BATV+e4e939a9a6de604c6042+5867+infradead.org+hch@bombadil.srs.infradead.org'
	RCPT:''
X-RedHat-Spam-Score: -2.398  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 198.137.202.133 bombadil.infradead.org 198.137.202.133
	bombadil.infradead.org
	<BATV+e4e939a9a6de604c6042+5867+infradead.org+hch@bombadil.srs.infradead.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>,
	lvm-devel@redhat.com, dm-devel@redhat.com, Milan Broz <mbroz@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm: introduce DM_GET_TARGET_VERSION
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]); Mon, 16 Sep 2019 18:01:44 +0000 (UTC)

On Mon, Sep 16, 2019 at 05:55:42AM -0400, Mikulas Patocka wrote:
> This patch introduces a new ioctl DM_GET_TARGET_VERSION. It will load a
> target that is specified in the "name" entry in the parameter structure
> and return its version.
> 
> This functionality is intended to be used by cryptsetup, so that it can
> query kernel capabilities before activating the device.

Well, if you want to query kernel features you better ask for a feature
bitmap than a version number, which can be rather meaningless with
the amount of backporting that is going on.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
