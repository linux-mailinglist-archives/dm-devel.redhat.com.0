Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E3B6370A
	for <lists+dm-devel@lfdr.de>; Tue,  9 Jul 2019 15:36:49 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2F4FA30C34D8;
	Tue,  9 Jul 2019 13:36:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B6C23848D6;
	Tue,  9 Jul 2019 13:36:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9A3DC1833001;
	Tue,  9 Jul 2019 13:35:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x69DZ62S009948 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 9 Jul 2019 09:35:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B495A1001DC0; Tue,  9 Jul 2019 13:35:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AEDBA1001DCF
	for <dm-devel@redhat.com>; Tue,  9 Jul 2019 13:35:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E01AA3086226
	for <dm-devel@redhat.com>; Tue,  9 Jul 2019 13:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZlleqwsBn7BmZliHrqi3djlddT2PkW1FB0HeyQ6RH7w=;
	b=YEP/fYLhWurY7phXsWPmaqvq9
	beoLxsBStHVvofaHYkrBYjLxPIwLgCTX++qT+qhvLmkulmkFj1P0CyLOBZSNjocJHgeh3NLXaVYr2
	/eN8uW9lfH4evJ16G1hBU+U1X+iNq1gG1asA5KCqzpIkUzeCgLVr+gdyn+dQlDK6o4rBIIcQ7rOAX
	Z05RUCEAF2uYvyRUIHX3EmNLfGUxFc6y8NiTr66ejPj3Ih7rj2CZklVUVLytITD5OLIlaH05nGfu+
	/oXThcPXYBEIuldrNPXY8r2poS6xEjFjbdGMx0MJraPQlnD/qHGQbfXvKqYCfA7qpc0ycY4EOMdTF
	IesA+tFAw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
	Linux)) id 1hkqGS-0000gU-AR; Tue, 09 Jul 2019 13:34:36 +0000
Date: Tue, 9 Jul 2019 06:34:36 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20190709133436.GA2231@infradead.org>
References: <20190708213551.26349-1-petr.vorel@gmail.com>
	<20190709024742.GA22293@infradead.org>
	<20190709080204.GA12875@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190709080204.GA12875@dell5510>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Greylist: Delayed for 10:46:49 by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.42]); Tue, 09 Jul 2019 13:34:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Tue, 09 Jul 2019 13:34:50 +0000 (UTC) for IP:'198.137.202.133'
	DOMAIN:'bombadil.infradead.org' HELO:'bombadil.infradead.org'
	FROM:'BATV+bec926e348f386e4ec5b+5798+infradead.org+hch@bombadil.srs.infradead.org'
	RCPT:''
X-RedHat-Spam-Score: -2.398  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 198.137.202.133 bombadil.infradead.org 198.137.202.133
	bombadil.infradead.org
	<BATV+bec926e348f386e4ec5b+5798+infradead.org+hch@bombadil.srs.infradead.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Christoph Hellwig <hch@infradead.org>, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 1/1] kpartx: Use __kernel_daddr_t for
 solaris_x86_slice.s_start
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Tue, 09 Jul 2019 13:36:47 +0000 (UTC)

On Tue, Jul 09, 2019 at 10:02:05AM +0200, Petr Vorel wrote:
> 
> > What this really should use is fixed size types.
> If it's not specific to __kernel_daddr_t nor daddr_t ("The type of a disk
> address") and long is sufficient for all platforms, that's even better.
> 
> I'd be just for removing typedef int daddr_t comment.
> 
> BTW gpart also uses struct solaris_x86_slice, with daddr_t [1].
> I've filed a PR [2], but I guess I'll change it to long.

solaris_x86_slice is an on-disk format, defined for good old 32-bit
x86 Solaris.  So the question is not if it is enough, but if it matches
what Solaris does.  I don't have the Solaris source at the moment,
but here is what the Linux kernel uses:

struct solaris_x86_slice {
        __le16 s_tag;           /* ID tag of partition */
        __le16 s_flag;          /* permission flags */
        __le32 s_start;         /* start sector no of partition */
        __le32 s_size;          /* # of blocks in partition */
};

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
