Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7527E5EDF15
	for <lists+dm-devel@lfdr.de>; Wed, 28 Sep 2022 16:46:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664376376;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DBdzNN+zDdowBjyfLALjiYmMgP9HuQ0Ufd740lnxcac=;
	b=GecO8p9nbIH49dlbsw2OdJt+yb7W02wODZEm6fakvg+EEJYmxklf7IT5iC8ySsoDom9/OQ
	3UKh0sV/ODujOKNT+cOJ2jeb80i2EH8z4timaEr+lDzfV0hDb2DT7eCMMV6fee/kYsHkFv
	9WCYpneqVbOTvTeX9IzD/wBonJ9b5ZM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-82-O48DvidHPH-txSdmXVfZPw-1; Wed, 28 Sep 2022 10:46:14 -0400
X-MC-Unique: O48DvidHPH-txSdmXVfZPw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EAC7F3C0D193;
	Wed, 28 Sep 2022 14:46:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BBD56492B05;
	Wed, 28 Sep 2022 14:46:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 313851946A54;
	Wed, 28 Sep 2022 14:46:06 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 07DEA19465B1
 for <dm-devel@listman.corp.redhat.com>; Wed, 28 Sep 2022 14:22:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CD48A49BB61; Wed, 28 Sep 2022 14:22:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C144492CA4
 for <dm-devel@redhat.com>; Wed, 28 Sep 2022 14:22:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 677A429AA3BB
 for <dm-devel@redhat.com>; Wed, 28 Sep 2022 14:22:41 +0000 (UTC)
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-445-24Ge4dVnMPW7NSMnlgMQew-1; Wed, 28 Sep 2022 10:22:39 -0400
X-MC-Unique: 24Ge4dVnMPW7NSMnlgMQew-1
Received: by mail-qv1-f71.google.com with SMTP id
 lq8-20020a0562145b8800b004ad7229e4e9so7882493qvb.6
 for <dm-devel@redhat.com>; Wed, 28 Sep 2022 07:22:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=8eB83t+uAXU0eeIFIBcJy7R/AwuzdJ0SXvnM1E+9aQE=;
 b=Z1XQ5PE2LqdAjYCHRmTnJ74wphfOzPdkh2+jXQhkdkxZw48MhhvRFvUZ+GQBsn7UOo
 L3aS0o4RyxFH3Br/GmA9dKxrl8T5yMYDfYZhnozraCnpApkU0ji+e+jnoSsLIvkogoNm
 q3MIjh/Z4qyKDre4xEPMradOCfU6FMbwhMnVO4vveQgt2YGvNFsVBDY63xUEG5N/Ox2p
 4OtH9tGX1bXBldYey9eZrWBnTqwey55Kd+fHriteHTtGKkQ2DYkBWkNmKb7plnam2eq4
 lOH7D9D4DCKmojHCDi/EJ2KB1f+bElQMMbQirFCmIMV+p3jkDPP/bIfB9ptng1Lp9i1J
 490w==
X-Gm-Message-State: ACrzQf2zFQdtVeQtgvzImmFhvUCGalibijFaKHQPMZtIugCO0tsbkQRe
 vtBBRMSLaotKk2uY9GoEn1bBciXmEfFdVqgPP3P8nWzZROawNobZCBxL7eTXhUA1YSvswOqIKF2
 m8fFWw2J8Z7t3dg==
X-Received: by 2002:a05:620a:12b5:b0:6cd:f08a:5d4f with SMTP id
 x21-20020a05620a12b500b006cdf08a5d4fmr21775548qki.8.1664374959195; 
 Wed, 28 Sep 2022 07:22:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6fmKzRNXSuxW01rhdqH0LlsG4b/0woL5Epyq9ljOUekYyldjofq1FKZh/mDRdfgWqVKl7cTA==
X-Received: by 2002:a05:620a:12b5:b0:6cd:f08a:5d4f with SMTP id
 x21-20020a05620a12b500b006cdf08a5d4fmr21775532qki.8.1664374958971; 
 Wed, 28 Sep 2022 07:22:38 -0700 (PDT)
Received: from localhost (pool-68-160-173-162.bstnma.fios.verizon.net.
 [68.160.173.162]) by smtp.gmail.com with ESMTPSA id
 cp4-20020a05622a420400b00359961365f1sm2859790qtb.68.2022.09.28.07.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 07:22:38 -0700 (PDT)
Date: Wed, 28 Sep 2022 10:22:36 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Pankaj Raghav <p.raghav@samsung.com>
Message-ID: <YzRYrNBB35fLjAO4@redhat.com>
References: <20220923173618.6899-1-p.raghav@samsung.com>
 <CGME20220923173634eucas1p18fccee11155c670354da389b4d2f4c60@eucas1p1.samsung.com>
 <20220923173618.6899-14-p.raghav@samsung.com>
MIME-Version: 1.0
In-Reply-To: <20220923173618.6899-14-p.raghav@samsung.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [dm-devel] [PATCH v15 13/13] dm: add power-of-2 target for
 zoned devices with non power-of-2 zone sizes
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
Cc: axboe@kernel.dk, Damien Le Moal <damien.lemoal@wdc.com>, bvanassche@acm.org,
 pankydev8@gmail.com, gost.dev@samsung.com, damien.lemoal@opensource.wdc.com,
 snitzer@kernel.org, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-block@vger.kernel.org,
 dm-devel@redhat.com, matias.bjorling@wdc.com,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, jaegeuk@kernel.org,
 hch@lst.de, agk@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 23 2022 at  1:36P -0400,
Pankaj Raghav <p.raghav@samsung.com> wrote:

> Only zoned devices with power-of-2(po2) number of sectors per zone(zone
> size) were supported in linux but now non power-of-2(npo2) zone sizes
> support has been added to the block layer.
> 
> Filesystems such as F2FS and btrfs have support for zoned devices with
> po2 zone size assumption. Before adding native support for npo2 zone
> sizes, it was suggested to create a dm target for npo2 zone size device to
> appear as a po2 zone size target so that file systems can initially
> work without any explicit changes.
> 
> The design of this target is very simple: remap the device zone size to
> the zone capacity and change the zone size to be the nearest power of 2
> value.
> 
> For e.g., a device with a zone size/capacity of 3M will have an equivalent
> target layout as follows:
> 
> Device layout :-
> zone capacity = 3M
> zone size = 3M
> 
> |--------------|-------------|
> 0             3M            6M
> 
> Target layout :-
> zone capacity=3M
> zone size = 4M
> 
> |--------------|---|--------------|---|
> 0             3M  4M             7M  8M
> 
> The area between target's zone capacity and zone size will be emulated
> in the target.
> The read IOs that fall in the emulated gap area will return 0 filled
> bio and all the other IOs in that area will result in an error.
> If a read IO span across the emulated area boundary, then the IOs are
> split across them. All other IO operations that span across the emulated
> area boundary will result in an error.
> 
> The target can be easily created as follows:
> dmsetup create <label> --table '0 <size_sects> po2zoned /dev/nvme<id>'
> 
> The target does not support partial mapping of the underlying
> device as there is no use-case for it.
> 
> Note:
> This target is not related to dm-zoned target, which exposes a zoned block
> device as a regular block device without any write constraint.
> 
> This target only exposes a different zone size than the underlying device.
> The underlying device's other constraints will be directly exposed to the
> target.
> 
> Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
> Suggested-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
> Suggested-by: Damien Le Moal <damien.lemoal@wdc.com>
> Suggested-by: Hannes Reinecke <hare@suse.de>

If/when this series is accepted by Jens and others the DM changes can
just be included along with the rest of the series.

Reviewed-by: Mike Snitzer <snitzer@kernel.org>

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

