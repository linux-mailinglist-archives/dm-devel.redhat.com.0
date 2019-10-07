Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 97159CDF62
	for <lists+dm-devel@lfdr.de>; Mon,  7 Oct 2019 12:32:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7D7053082B40;
	Mon,  7 Oct 2019 10:32:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D8EC5C219;
	Mon,  7 Oct 2019 10:32:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2E44B1808876;
	Mon,  7 Oct 2019 10:32:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x978R7qc029687 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 7 Oct 2019 04:27:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6593360C57; Mon,  7 Oct 2019 08:27:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F6ED60C05
	for <dm-devel@redhat.com>; Mon,  7 Oct 2019 08:27:02 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DBA1D309174E
	for <dm-devel@redhat.com>; Mon,  7 Oct 2019 08:27:01 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id 60so10265881otu.0
	for <dm-devel@redhat.com>; Mon, 07 Oct 2019 01:27:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VKymJxaLp2SF18G9ExdMOsAdXsmgBDVfrU/If3JZGxo=;
	b=SRNta1/G1L7RMCC0G6TCyG0xaEgEKwyYefc5clrhGLIuO3ZtsKEg9/VbnPsCWufWln
	kEPTsnX/W2E7dvcjea+wVNnNcE/brDe4NqIbdgekHxlCR5/Bhm6slM9F/fL/XUwHIKI4
	XRG0SOp7QjrIYaWq9lOL7UpcFNF3zAlxOxiN54NfxxGEfQR4MQgoH5mO9l1NUPcU4z2g
	zsre8nrUHdIeZPAIEZjCaar54UdbOq5ChgIAtPrMb0BJUOrE4Cbob0FcMHMJvLMOK5qw
	vyJZAOEK+dOLpLOs5AYVX0Kv41GsF/FQu/GdXV2T8BlRvOas5l/yocA2Qam0LODWvp+b
	Nlnw==
X-Gm-Message-State: APjAAAUaNEC272ULH8KCnsc9MOyTdK2zwYdrFMGtJzrXBZ5HbVCBzHLq
	zMMYzXtsBBBz4WTHJmESRtHXxUYtt47NPot4ErM=
X-Google-Smtp-Source: APXvYqxEOkV8nJCSllSqxdkQVypo90wcNgBvYDBNSKRgpoLJCvXTnmOdSLlUAojqzzfR9rCgupdlwodIFF5kpYpgt28=
X-Received: by 2002:a9d:17e6:: with SMTP id j93mr20339687otj.297.1570436821298;
	Mon, 07 Oct 2019 01:27:01 -0700 (PDT)
MIME-Version: 1.0
References: <20191004145544.5066-1-krzk@kernel.org>
	<20191004145544.5066-3-krzk@kernel.org>
In-Reply-To: <20191004145544.5066-3-krzk@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Oct 2019 10:26:49 +0200
Message-ID: <CAMuHMdW0DSujexoGq4CJAYP40DvMcigk08aEnyQ72haY6jds5Q@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Mon, 07 Oct 2019 08:27:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Mon, 07 Oct 2019 08:27:02 +0000 (UTC) for IP:'209.85.210.67'
	DOMAIN:'mail-ot1-f67.google.com' HELO:'mail-ot1-f67.google.com'
	FROM:'geert.uytterhoeven@gmail.com' RCPT:''
X-RedHat-Spam-Score: 0.253  (FREEMAIL_FORGED_FROMDOMAIN, FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.210.67 mail-ot1-f67.google.com 209.85.210.67
	mail-ot1-f67.google.com <geert.uytterhoeven@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 07 Oct 2019 06:31:55 -0400
Cc: linux-m68k <linux-m68k@vger.kernel.org>,
	linux-efi <linux-efi@vger.kernel.org>,
	Linux-sh list <linux-sh@vger.kernel.org>,
	linux-iio@vger.kernel.org, linux-pci <linux-pci@vger.kernel.org>,
	"open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
	<linux-remoteproc@vger.kernel.org>,
	Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
	DRI Development <dri-devel@lists.freedesktop.org>,
	platform-driver-x86@vger.kernel.org, linux-ide@vger.kernel.org,
	dm-devel@redhat.com, keyrings@vger.kernel.org,
	MTD Maling List <linux-mtd@lists.infradead.org>,
	Linux I2C <linux-i2c@vger.kernel.org>, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	ac100@lists.launchpad.net, linux-rtc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, scsi <linux-scsi@vger.kernel.org>,
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
	linux-rdma <linux-rdma@vger.kernel.org>, esc.storagedev@microsemi.com,
	linux-security-module@vger.kernel.org,
	linux-clk <linux-clk@vger.kernel.org>,
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
	bcm-kernel-feedback-list@broadcom.com,
	"open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
	linux-input@vger.kernel.org, xen-devel@lists.xenproject.org,
	virtualization@lists.linux-foundation.org,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	"moderated list:H8/300 ARCHITECTURE"
	<uclinux-h8-devel@lists.sourceforge.jp>,
	driverdevel <devel@driverdev.osuosl.org>,
	Linux PM list <linux-pm@vger.kernel.org>,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	linux-um@lists.infradead.org, linux-block@vger.kernel.org,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	Openrisc <openrisc@lists.librecores.org>,
	linux-mediatek@lists.infradead.org,
	linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
	linux-tegra <linux-tegra@vger.kernel.org>,
	openipmi-developer@lists.sourceforge.net,
	"open list:TI ETHERNET SWITCH DRIVER \(CPSW\)"
	<linux-omap@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-raid@vger.kernel.org, Jiri Kosina <trivial@kernel.org>,
	Linux MM <linux-mm@kvack.org>, netdev <netdev@vger.kernel.org>,
	Linux MMC List <linux-mmc@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-spi <linux-spi@vger.kernel.org>,
	Linux IOMMU <iommu@lists.linux-foundation.org>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	alpha <linux-alpha@vger.kernel.org>, dmaengine@vger.kernel.org,
	linux-integrity <linux-integrity@vger.kernel.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [dm-devel] [RESEND TRIVIAL 3/3] treewide: arch: Fix Kconfig
	indentation
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Mon, 07 Oct 2019 10:32:54 +0000 (UTC)

On Fri, Oct 4, 2019 at 4:57 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Adjust indentation from spaces to tab (+optional two spaces) as in
> coding style with command like:
>     $ sed -e 's/^        /\t/' -i */Kconfig
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

>  arch/m68k/Kconfig.bus                  |  2 +-
>  arch/m68k/Kconfig.debug                | 16 ++++++++--------
>  arch/m68k/Kconfig.machine              |  8 ++++----

For m68k:
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
