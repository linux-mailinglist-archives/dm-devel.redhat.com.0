Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DEB5ECABC
	for <lists+dm-devel@lfdr.de>; Tue, 27 Sep 2022 19:24:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664299490;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eoTfFkrB+HhI/IPonrf2VaTAZ3nJU0XfM1nREExfiww=;
	b=hGLrQbLeiysP0PjJhvWDjSKB6QR2XOnUqXzzwK0iA8qi18hjeGzHHxreTna9wFplK+tfNX
	waRD47Eph714Jex8sVrhQAcQuQcBoDwV0hWBg9Uoj2bOD83/XBoml4hZ24+ywrrwXI4hEP
	kQPlYJ0EGaBPetZV3PMau9VyoTAWvCM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-jckiRlumMFWKxIP_qiSjfw-1; Tue, 27 Sep 2022 13:24:48 -0400
X-MC-Unique: jckiRlumMFWKxIP_qiSjfw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB6DA882827;
	Tue, 27 Sep 2022 17:24:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6C3BC2166B26;
	Tue, 27 Sep 2022 17:24:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 346931946A4C;
	Tue, 27 Sep 2022 17:24:42 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3FA511946586
 for <dm-devel@listman.corp.redhat.com>; Tue, 27 Sep 2022 17:24:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2C1AA492B05; Tue, 27 Sep 2022 17:24:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2477F492B04
 for <dm-devel@redhat.com>; Tue, 27 Sep 2022 17:24:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08A48811E67
 for <dm-devel@redhat.com>; Tue, 27 Sep 2022 17:24:41 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-443-wzc-OrluNAiRNg4YniaaDQ-1; Tue, 27 Sep 2022 13:24:37 -0400
X-MC-Unique: wzc-OrluNAiRNg4YniaaDQ-1
Received: by mail-ej1-f48.google.com with SMTP id hy2so22128311ejc.8;
 Tue, 27 Sep 2022 10:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=3c45jsBfv/NH6ArNEDI+dXny5k9HP9bISyg7K6ga1ts=;
 b=Z7eMBCat9oc8JzfOZfPKztUPI9iu+yUHS6yY2UL35lRPIkzxAv7HaNANpIt5m50XQx
 Er4YU2JKwJQktsk/uCJFrMCcmq8uD2GaeCPtey+D6l7yClZVspaXHclqhawW3IHUs2sR
 jkIR+djiwazTgvnQAxPx6ncgikt/jZUbhmZ4mC/OxoYW2aTk/L2KyUoE/dK+7Yb7xhHm
 XBVcH06i+H+nNSbIFQOyfQ6pjryp3cx1x4n/hpHem3xQ/TDV35z0LpFErPWgaCROqnF1
 1yNzaax5x4j20bHOvC1x8+uZ4+6Exa5JkiO1QfIzRd+pgSEdevCHvhqLm9IuRkViGvSr
 1beQ==
X-Gm-Message-State: ACrzQf2DZlxDdnG09cQqMwekAANgFqHzvhg9pPo70gTU2F+sIRGvJg8X
 i/M0wmrRBmgMxl/Z7UQtAw0=
X-Google-Smtp-Source: AMsMyM6bVGEoBNsDGah9Y6IQGvNvYH0w0SrpNOSHA4CTKcxN33annU5SfoYAToZI6Zn8b3kERzk/0A==
X-Received: by 2002:a17:907:9602:b0:780:8c9f:f99a with SMTP id
 gb2-20020a170907960200b007808c9ff99amr24136114ejc.465.1664299475905; 
 Tue, 27 Sep 2022 10:24:35 -0700 (PDT)
Received: from [192.168.2.30] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a509989000000b0045391f7d877sm1715837edb.53.2022.09.27.10.24.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 10:24:35 -0700 (PDT)
Message-ID: <1a5e3ecd-04f5-cdd6-a284-a4c9d0999f11@gmail.com>
Date: Tue, 27 Sep 2022 19:24:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <alpine.LRH.2.02.2209260418360.16612@file01.intranet.prod.int.rdu2.redhat.com>
 <YzGYFBv0pdt+DQg+@kroah.com> <6c75a90d-3793-55fc-e525-eca14e562350@gmail.com>
 <YzMYuAaHRpydr7Fy@kroah.com>
From: Milan Broz <gmazyland@gmail.com>
In-Reply-To: <YzMYuAaHRpydr7Fy@kroah.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [dm-devel] [PATCH] kernfs: fix a crash when two processes
 delete the same directory
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>,
 Christoph Lameter <cl@linux.com>, Andrew Morton <akpm@linux-foundation.org>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On 9/27/22 17:37, Greg Kroah-Hartman wrote:
> On Tue, Sep 27, 2022 at 05:22:46PM +0200, Milan Broz wrote:
>> On 9/26/22 14:16, Greg Kroah-Hartman wrote:
>>> On Mon, Sep 26, 2022 at 07:04:52AM -0400, Mikulas Patocka wrote:
>>>> There is a crash when running the cryptsetup testsuite on Fedora Rawhide.
>>>> It can be reproduced by installing Rawhide with the 6.0-rc6 kernel,
>>>> downloading and compiling the cryptsetup repository and running this test
>>>> in a loop for about 15 minuts:
>>>> 	while ./integrity-compat-test; do :; done
>>>>
>>>>    ------------[ cut here ]------------
>>>>    WARNING: CPU: 0 PID: 50087 at fs/kernfs/dir.c:504 __kernfs_remove.part.0+0x26f/0x2b0
>>>>    Modules linked in: crc32_generic loop dm_integrity async_xor async_tx tls isofs uinput snd_seq_dummy snd_hrtimer nft_objref nf_conntrack_netbios_ns nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 rfkill ip_set nf_tables nfnetlink qrtr sunrpc snd_hda_codec_generic ledtrig_audio snd_hda_intel iTCO_wdt snd_intel_dspcfg intel_pmc_bxt snd_intel_sdw_acpi iTCO_vendor_support snd_hda_codec snd_hda_core snd_hwdep snd_seq snd_seq_device joydev snd_pcm i2c_i801 snd_timer pcspkr i2c_smbus virtio_balloon snd lpc_ich soundcore zram virtio_net net_failover virtio_blk serio_raw failover qxl virtio_console drm_ttm_helper ttm ip6_tables ip_tables fuse qemu_fw_cfg
>>>>    Unloaded tainted modules: crc32_pclmul():1 pcc_cpufreq():1 pcc_cpufreq():1 acpi_cpufreq():1 edac_mce_amd():1 pcc_cpufreq():1 acpi_cpufreq():1 edac_mce_amd():1 acpi_cpufreq():1 edac_mce_amd():1 pcc_cpufreq():1 acpi_cpufreq():1 pcc_cpufreq():1 edac_mce_amd():1 edac_mce_amd():1 acpi_cpufreq():1 pcc_cpufreq():1 edac_mce_amd():1 acpi_cpufreq():1 pcc_cpufreq():1 edac_mce_amd():1 acpi_cpufreq():1 pcc_cpufreq():1 edac_mce_amd():1 acpi_cpufreq():1 edac_mce_amd():1 pcc_cpufreq():1 edac_mce_amd():1 acpi_cpufreq():1 pcc_cpufreq():1 edac_mce_amd():1 pcc_cpufreq():1 acpi_cpufreq():1 edac_mce_amd():1 pcc_cpufreq():1 acpi_cpufreq():1 acpi_cpufreq():1
>>>>    CPU: 0 PID: 50087 Comm: integritysetup Not tainted 6.0.0-0.rc6.41.fc38.x86_64 #1
>>>>    Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.14.0-2 04/01/2014
>>>>    RIP: 0010:__kernfs_remove.part.0+0x26f/0x2b0
>>
>> ...
>>
>>> Can you see if 4abc99652812 ("kernfs: fix use-after-free in
>>> __kernfs_remove") in linux-next fixes this for you or not?  It seems to
>>> be the same issue, as was also reported at:
>>> 	https://lore.kernel.org/r/7f489b14-2fdc-3d91-c87e-6a802bd8592d@I-love.SAKURA.ne.jp
>>
>>
>> I tried it on system where cryptsetup testsuite almost immediately crashed in the integrity test.
>>
>> With the patch in https://lore.kernel.org/r/7f489b14-2fdc-3d91-c87e-6a802bd8592d@I-love.SAKURA.ne.jp
>> it now iterates for some time without any problems, so I think it is fixed.
>>
>> Tested-by: Milan Broz <gmazyland@gmail.com>
> 
> Wait, what about the patch that is in linux-next that I pointed to, not
> the one in the email?

Ehm, yes, my mistake.

Now tested 4abc99652812 (it is not visible in any branch anymore, perhaps rebased).

Already running several iterations and no problems, so for the correct patch now:

Tested-by: Milan Broz <gmazyland@gmail.com>

Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

