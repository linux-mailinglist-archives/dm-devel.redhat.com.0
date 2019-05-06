Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C16D15F9C
	for <lists+dm-devel@lfdr.de>; Tue,  7 May 2019 10:42:40 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B3031307EA8D;
	Tue,  7 May 2019 08:42:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 41B40646A1;
	Tue,  7 May 2019 08:42:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CC24018089CA;
	Tue,  7 May 2019 08:42:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x46Jq4Z6021313 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 6 May 2019 15:52:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 611CC5E1A7; Mon,  6 May 2019 19:52:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A27775C21A;
	Mon,  6 May 2019 19:51:57 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [85.118.1.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 11201307D854;
	Mon,  6 May 2019 19:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=svFixFLsbnaR5DUt4ImgtkhN2pmye2Nmylim0WQyDAU=;
	b=K9WI+zD/+TOTuXyzRM3G0QrDjG
	O43eurvDKzXS14FOyzPI66y2DyZJK3ddvQ17HuJpD3Dkbpp79KIPyIc15lIW7bL6o/2IGwUXHJnoE
	7oG1A+M8EAKYBGhEWvxDE7yw1SsCjeVfdDN46pMZVeJiXYcFYpEZ6BVHabmbsYj7K+l8d+CO0NsWJ
	X90cZKjwaT2MBtVvJEsxuHXwkk036LS07zGrOkcMW419VfZxtnGajVdxgtgQf3BRcrzFoI/6TKMGE
	BMrjekCKBlvsGpjvJHnwEr+tmcnRqswvMdmTpdFRftvLfz9mwyOr5M27O56OJUnDhbZTYUnkXIrGm
	zPeBiieQ==;
Received: from [179.182.172.35] (helo=coco.lan)
	by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNje4-000732-8K; Mon, 06 May 2019 19:51:28 +0000
Date: Mon, 6 May 2019 16:50:59 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Message-ID: <20190506165059.51eb2959@coco.lan>
In-Reply-To: <20190424065209.GC4038@hirez.programming.kicks-ass.net>
References: <cover.1555938375.git.mchehab+samsung@kernel.org>
	<cda57849a6462ccc72dcd360b30068ab6a1021c4.1555938376.git.mchehab+samsung@kernel.org>
	<20190423083135.GA11158@hirez.programming.kicks-ass.net>
	<20190423125519.GA7104@redhat.com>
	<20190423130132.GT4038@hirez.programming.kicks-ass.net>
	<20190423103053.07cf2149@lwn.net>
	<20190423171158.GG12232@hirez.programming.kicks-ass.net>
	<20190423172006.GD16353@zn.tnic> <20190423170409.7b1370ac@coco.lan>
	<20190423213816.GE16353@zn.tnic>
	<20190424065209.GC4038@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.48]); Mon, 06 May 2019 19:51:56 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Mon, 06 May 2019 19:51:56 +0000 (UTC) for IP:'85.118.1.10'
	DOMAIN:'casper.infradead.org' HELO:'casper.infradead.org'
	FROM:'mchehab+samsung@kernel.org' RCPT:''
X-RedHat-Spam-Score: -1.328  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_MED,
	SPF_SOFTFAIL) 85.118.1.10 casper.infradead.org
	85.118.1.10 casper.infradead.org <mchehab+samsung@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 07 May 2019 04:42:14 -0400
Cc: Mike Snitzer <snitzer@redhat.com>, "Rafael
	J. Wysocki" <rafael@kernel.org>, Walleij <linus.walleij@linaro.org>,
	Farhan Ali <alifm@linux.ibm.com>, Will Deacon <will.deacon@arm.com>,
	dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
	kernel-hardening@lists.openwall.com, Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-arch@vger.kernel.org, linux-sh@vger.kernel.org,
	James Morris <jmorris@namei.org>, Halil Pasic <pasic@linux.ibm.com>,
	tboot-devel@lists.sourceforge.net, Alan Stern <stern@rowland.harvard.edu>,
	openipmi-developer@lists.sourceforge.net,
	Guenter Roeck <linux@roeck-us.net>, Boqun Feng <boqun.feng@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Mackall <mpm@selenic.com>, Thomas Gleixner <tglx@linutronix.de>,
	Sean Paul <sean@poorly.run>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, Martin,
	Mark Rutland <mark.rutland@arm.com>, linux-fbdev@vger.kernel.org,
	linux-ia64@vger.kernel.org, David Airlie <airlied@linux.ie>, "James E.J.
	Bottomley" <James.Bottomley@HansenPartnership.com>, dm-devel@redhat.com,
	Harry Wei <harryxiyou@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Alasdair Kergon <agk@redhat.com>, linux-s390@vger.kernel.org,
	Matt, Alex Shi <alex.shi@linux.alibaba.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Changbin Du <changbin.du@gmail.com>, Eric Farman <farman@linux.ibm.com>,
	linux-watchdog@vger.kernel.org, Minyard <minyard@acm.org>,
	Carvalho Chehab <mchehab@infradead.org>,
	linaro-mm-sig@lists.linaro.org, linux-gpio@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org,
	Tony Luck <tony.luck@intel.com>,
	Cornelia Huck <cohuck@redhat.com>, Steffen,
	"David S. Miller" <davem@davemloft.net>,
	Schwidefsky <schwidefsky@de.ibm.com>,
	Andrea Parri <andrea.parri@amarulasolutions.com>,
	linux-pci@vger.kernel.org, Wim, Akira Yokosawa <akiyks@gmail.com>,
	Heiko Carstens <heiko.carstens@de.ibm.com>,
	platform-driver-x86@vger.kernel.org,
	"Paul E. McKenney" <paulmck@linux.ibm.com>, Linus,
	Jonathan Corbet <corbet@lwn.net>, Kishon Vijay Abraham I <kishon@ti.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Emese Revfy <re.emese@gmail.com>, Andy, Darren Hart <dvhart@infradead.org>,
	Jade Alglave <j.alglave@ucl.ac.uk>, "Serge
	E. Hallyn" <serge@hallyn.com>, Fenghua Yu <fenghua.yu@intel.com>,
	Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
	Zolnierkiewicz <b.zolnierkie@samsung.com>,
	Ning Sun <ning.sun@intel.com>, Borislav Petkov <bp@alien8.de>,
	Bartlomiej, Luc Maranget <luc.maranget@inria.fr>,
	Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
	Guan Xuetao <gxt@pku.edu.cn>, linux-parisc@vger.kernel.org,
	iommu@lists.linux-foundation.org, Stuart Hayes <stuart.w.hayes@gmail.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Andreas =?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>,
	Rich Felker <dalias@libc.org>, kvm@vger.kernel.org,
	Maxime Ripard <maxime.ripard@bootlin.com>,
	Jerry Hoemann <jerry.hoemann@hpe.com>,
	David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
	Kirti Wankhede <kwankhede@nvidia.com>,
	"H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
	Mauro, Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>, x86@kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Ingo Molnar <mingo@redhat.com>, devicetree@vger.kernel.org,
	Daniel Lustig <dlustig@nvidia.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	linux-block@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Van Sebroeck <wim@linux-watchdog.org>,
	Jens Axboe <axboe@kernel.dk>, netdev@vger.kernel.org,
	linux-security-module@vger.kernel.org, Corey,
	Daniel Vetter <daniel@ffwll.ch>, Johannes Berg <johannes@sipsolutions.net>,
	Robin Murphy <robin.murphy@arm.com>, Shevchenko <andy@infradead.org>
Subject: Re: [dm-devel] [PATCH v2 56/79] docs: Documentation/*.txt: rename
 all ReST files to *.rst
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Tue, 07 May 2019 08:42:39 +0000 (UTC)

Em Wed, 24 Apr 2019 08:52:09 +0200
Peter Zijlstra <peterz@infradead.org> escreveu:

> On Tue, Apr 23, 2019 at 11:38:16PM +0200, Borislav Petkov wrote:
> > If that is all the changes it would need, then I guess that's ok. Btw,
> > those rst-conversion patches don't really show what got changed. Dunno
> > if git can even show that properly. I diffed the two files by hand to
> > see what got changed, see end of mail.  
> 
> That is not a happy diff; that table has gotten waay worse to read due
> to all that extra table crap.

Not that I'm proposing such change, but, as a reference, I just discovered 
today that there's a way to make it even lighter than it is while still
showing it as a table:

=================  ======== ==   ================  ===== ==  ===========================================================
    Start addr        Offset        End addr         Size    VM area description
-----------------  -----------   ----------------  --------  -----------------------------------------------------------
 0000000000000000      0         00007fffffffffff    128 TB   user-space virtual memory, different per mm

 0000800000000000   +128    TB   ffff7fffffffffff   ~16M TB   ... huge, almost 64 bits wide hole of non-canonical
                                                                  virtual memory addresses up to the -128 TB
                                                                  starting offset of kernel mappings.

-----------------  -------- --   ----------------  ----- --  -----------------------------------------------------------
-                                                            Kernel-space virtual memory, shared between all processes:
-----------------  -----------   ----------------  --------  -----------------------------------------------------------

 ffff800000000000   -128    TB   ffff87ffffffffff      8 TB   ... guard hole, also reserved for hypervisor
 ffff880000000000   -120    TB   ffff887fffffffff    0.5 TB   LDT remap for PTI
 ffff888000000000   -119.5  TB   ffffc87fffffffff     64 TB   direct mapping of all physical memory (page_offset_base)
 ffffc88000000000    -55.5  TB   ffffc8ffffffffff    0.5 TB   ... unused hole
 ffffc90000000000    -55    TB   ffffe8ffffffffff     32 TB   vmalloc/ioremap space (vmalloc_base)
 ffffe90000000000    -23    TB   ffffe9ffffffffff      1 TB   ... unused hole
 ffffea0000000000    -22    TB   ffffeaffffffffff      1 TB   virtual memory map (vmemmap_base)
 ffffeb0000000000    -21    TB   ffffebffffffffff      1 TB   ... unused hole
 ffffec0000000000    -20    TB   fffffbffffffffff     16 TB   KASAN shadow memory
-----------------  -------- --   ----------------  ----- --  -----------------------------------------------------------
-                                                            Identical layout to the 56-bit one from here on:
-----------------  -----------   ----------------  --------  -----------------------------------------------------------

 fffffc0000000000     -4    TB   fffffdffffffffff      2 TB   ... unused hole
                                                              vaddr_end for KASLR
 fffffe0000000000     -2    TB   fffffe7fffffffff    0.5 TB   cpu_entry_area mapping
 fffffe8000000000     -1.5  TB   fffffeffffffffff    0.5 TB   ... unused hole
 ffffff0000000000     -1    TB   ffffff7fffffffff    0.5 TB   %esp fixup stacks
 ffffff8000000000   -512    GB   ffffffeeffffffff    444 GB   ... unused hole
 ffffffef00000000    -68    GB   fffffffeffffffff     64 GB   EFI region mapping space
 ffffffff00000000     -4    GB   ffffffff7fffffff      2 GB   ... unused hole
 ffffffff80000000     -2    GB   ffffffff9fffffff    512 MB   kernel text mapping, mapped to physical address 0
 ffffffff80000000  -2048    MB
 ffffffffa0000000  -1536    MB   fffffffffeffffff   1520 MB   module mapping space
 ffffffffff000000    -16    MB
    FIXADDR_START   ~-11    MB   ffffffffff5fffff   ~0.5 MB   kernel-internal fixmap range, variable size and offset
 ffffffffff600000    -10    MB   ffffffffff600fff      4 kB   legacy vsyscall ABI
 ffffffffffe00000     -2    MB   ffffffffffffffff      2 MB   ... unused hole
=================  ======== ==   ================  ===== ==  ===========================================================

If one wants the table headers as such, an extra line is required:


=================  ======== ==   ================  ===== ==  ===========================================================
    Start addr        Offset        End addr         Size    VM area description
-----------------  -----------   ----------------  --------  -----------------------------------------------------------
=================  ======== ==   ================  ===== ==  ===========================================================

<snip/>

=================  ======== ==   ================  ===== ==  ===========================================================


The output using this approach and a markup to use mono-spaced cells
e. g. either using ..raw or using .. cssclass as commented before in
this thread is at:

	https://www.infradead.org/~mchehab/rst_conversion/x86/x86_64/mm_alternative.html

Just converted the first table, keeping the other as a literal block.

Thanks,
Mauro

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
