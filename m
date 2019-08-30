Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A3DA3532
	for <lists+dm-devel@lfdr.de>; Fri, 30 Aug 2019 12:47:56 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D62793082141;
	Fri, 30 Aug 2019 10:47:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 482205D9E5;
	Fri, 30 Aug 2019 10:47:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 436E289CF;
	Fri, 30 Aug 2019 10:47:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7UAlVeG015256 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 30 Aug 2019 06:47:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9A34F60CC0; Fri, 30 Aug 2019 10:47:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9618760F82
	for <dm-devel@redhat.com>; Fri, 30 Aug 2019 10:47:29 +0000 (UTC)
Received: from smtp.hosts.co.uk (smtp.hosts.co.uk [85.233.160.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CFAA8C05AA52
	for <dm-devel@redhat.com>; Fri, 30 Aug 2019 10:47:26 +0000 (UTC)
Received: from [81.153.82.187] (helo=[192.168.1.118])
	by smtp.hosts.co.uk with esmtpa (Exim)
	(envelope-from <antlists@youngman.org.uk>)
	id 1i3eRB-0000pe-3q; Fri, 30 Aug 2019 11:47:25 +0100
To: Song Liu <songliubraving@fb.com>,
	"Guilherme G. Piccoli" <gpiccoli@canonical.com>
References: <20190822161318.26236-1-gpiccoli@canonical.com>
	<73C4747E-7A9E-4833-8393-B6A06C935DBE@fb.com>
	<8163258e-839c-e0b8-fc4b-74c94c9dae1d@canonical.com>
	<F0E716F8-76EC-4315-933D-A547B52F1D27@fb.com>
From: Wols Lists <antlists@youngman.org.uk>
Message-ID: <5D68FEBC.9060709@youngman.org.uk>
Date: Fri, 30 Aug 2019 11:47:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.0
MIME-Version: 1.0
In-Reply-To: <F0E716F8-76EC-4315-933D-A547B52F1D27@fb.com>
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.32]); Fri, 30 Aug 2019 10:47:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Fri, 30 Aug 2019 10:47:27 +0000 (UTC) for IP:'85.233.160.19'
	DOMAIN:'smtp.hosts.co.uk' HELO:'smtp.hosts.co.uk'
	FROM:'antlists@youngman.org.uk' RCPT:''
X-RedHat-Spam-Score: -0.702  (RCVD_IN_DNSWL_LOW, SPF_HELO_PASS,
	SPF_PASS) 85.233.160.19 smtp.hosts.co.uk 85.233.160.19
	smtp.hosts.co.uk <antlists@youngman.org.uk>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.32
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Song Liu <liu.song.a23@gmail.com>, NeilBrown <neilb@suse.com>,
	linux-raid <linux-raid@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Jay Vosburgh <jay.vosburgh@canonical.com>
Subject: Re: [dm-devel] [PATCH v3 1/2] md raid0/linear: Mark array as
 'broken' and fail BIOs if a member is gone
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Fri, 30 Aug 2019 10:47:55 +0000 (UTC)

On 23/08/19 18:51, Song Liu wrote:
> I guess md_is_broken() should return bool? Otherwise, looks good to me. 

Just an outsider's observation - if the function is actually checking
whether a member is missing maybe it should read

   broken = md_member_is_missing();

That way the function says what it does, and the assignment says what
you're doing with it.

Cheers,
Wol

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
