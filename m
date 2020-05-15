Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 7628F1D5ABC
	for <lists+dm-devel@lfdr.de>; Fri, 15 May 2020 22:38:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589575091;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4EcewKIh8n9vm1PZzg+1PE+mv2bQ5y89veU+AN4tADo=;
	b=JaSoQ4PUU/kQdOJ2xtva5qN4D466MMIpmHmLlRZS2LKYw/kSgjwihWvK3slcY3vl0djScv
	rSA9CmU0BP8mBRCBDkk678OONa//nHl9YS3aMV7liN2vY9TgHtXNZkKEIPJp6KAHTGLkjP
	Csc2IvnLeGWHz5jPkMKLcCZs/307oG4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-7AvAARzUO52mSmuXpHDfog-1; Fri, 15 May 2020 16:38:07 -0400
X-MC-Unique: 7AvAARzUO52mSmuXpHDfog-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E08E88015CF;
	Fri, 15 May 2020 20:38:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60E3060C05;
	Fri, 15 May 2020 20:38:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BFE851809543;
	Fri, 15 May 2020 20:37:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04FKbsC6007749 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 15 May 2020 16:37:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2903D10913B5; Fri, 15 May 2020 20:37:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 096F610A1438
	for <dm-devel@redhat.com>; Fri, 15 May 2020 20:37:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2CF768A19F6
	for <dm-devel@redhat.com>; Fri, 15 May 2020 20:37:44 +0000 (UTC)
Received: from m9a0014g.houston.softwaregrp.com
	(m9a0014g.houston.softwaregrp.com [15.124.64.90]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-172-yVAPl7eUPa-qOK0yl8KvDg-1;
	Fri, 15 May 2020 16:37:39 -0400
X-MC-Unique: yVAPl7eUPa-qOK0yl8KvDg-1
Received: FROM m9a0014g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0014g.houston.softwaregrp.com WITH ESMTP; 
	Fri, 15 May 2020 20:36:47 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Fri, 15 May 2020 20:37:24 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.8.13) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Fri, 15 May 2020 20:37:24 +0000
Received: from DM5PR1801MB1883.namprd18.prod.outlook.com (2603:10b6:4:62::23)
	by DM5PR1801MB1996.namprd18.prod.outlook.com (2603:10b6:4:62::31)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.34;
	Fri, 15 May 2020 20:37:23 +0000
Received: from DM5PR1801MB1883.namprd18.prod.outlook.com
	([fe80::cd6:b672:d8d3:2710]) by
	DM5PR1801MB1883.namprd18.prod.outlook.com
	([fe80::cd6:b672:d8d3:2710%7]) with mapi id 15.20.2979.033;
	Fri, 15 May 2020 20:37:23 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 4/6] Unit tests for is_path_valid()
Thread-Index: AQHWKlyIPZxvoznOo0qxPEQVwpLYqKipnIqA
Date: Fri, 15 May 2020 20:37:23 +0000
Message-ID: <9b472a9cdcea88daf12e74733eb579e489daded5.camel@suse.com>
References: <1589507962-6895-1-git-send-email-bmarzins@redhat.com>
	<1589507962-6895-5-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1589507962-6895-5-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2
x-originating-ip: [92.211.129.134]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e066dfa5-6301-40cc-4b1a-08d7f90fc595
x-ms-traffictypediagnostic: DM5PR1801MB1996:
x-microsoft-antispam-prvs: <DM5PR1801MB1996DC9835BB560CAF9789AFFCBD0@DM5PR1801MB1996.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 04041A2886
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c1p5QRHW2Bio+9+Cp8nImGj/sjVBxf60mnF0KbLFadihZtdWSFdcGF+hmVI8A43lMUrYB/JTg4SQdfLqthkCD/L9MeFDIN8tAEvXEuU7XgFXqw1HD3YV5s6oSQS3VINpGPMbilyJbsl9+Ivq2UyqIZsE3uNa1KM/8tgq42Tg1NDcuIGemIBW0OMpE0bQPLVwrzxWA6jDvPbuMDGPzNYSZ/o5sIbGST2avkAXaBAP7WPjiUWafmQcGlFDahE2pqd4hTGcAtmoDmVu1PXAKhuuTOkZSzF3ihm0l54LWYssNo2Z1C6x9LEDHZ/8n9XK8H4XPamIp1l1KW/PTTzUvPb+QKQvBioauYtCfQVJPQ6JYyz9PbqWev60xgUmy1jo1ci6ypR+kX3vybdnmzhUm3DGVHGqsMacENTqvb/isROvkzMw9D4LnPUJrveA0u7BIBYDB+jCkp/nMTo1IlzJdojfngRiNEw1eAsEVK/sq4mArg+Hx0J2ingp/bLcaM4yR89uGCUqJS1Hril4wQN3gqEoj4U4EiC1vOxINllWogpd9y79FKjqWT2sU4fQW50+I15q
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DM5PR1801MB1883.namprd18.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(376002)(366004)(396003)(136003)(39860400002)(346002)(110136005)(66556008)(966005)(5660300002)(6512007)(8936002)(66446008)(316002)(26005)(478600001)(71200400001)(76116006)(66574014)(86362001)(8676002)(30864003)(91956017)(36756003)(66476007)(66946007)(64756008)(2906002)(4326008)(186003)(6506007)(2616005)(6486002)(2004002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: Olm8umPjr/tI8AwjFRMcU8zJd6nRb/0qBtotQZb3J/ucEjaWkpzHSHOncZM3z4mUFY9j5rKq5jTpgv7HW+AhhOvAjAMGUq/xGTDEg7V6w3P+2Q6vVsbymQORt/9fjehLcmeyRTvLkDX5RP6e6DyWx1AFZJRTEEcvmT7mjcT6kDk553sg4GH/EWR3zqcZCGmG8REVFtxqCRi4ewJhH4GTfRxVSp56OAxJLn1NBDPpiMXNR/OlSoj9AE3cObphm2Wm1yUGIfQAV45ghoH1W/kmd7tIcPx3PzjqP8T9JL/s04L2ANoVQiGwUygIAbDlN6DfND4p/r6yrPLDZcncjobHjsE6pqhTCpxK4PnQmghaoaWxjdphqQdZnZMoID5Srm6IjYYghkmPWZWAMpTZMoKbAkIjBqb6CFGsClQZ/d6tBmzZjaZh2N+sovuj3m/09SByEO/M8IkrYQn0cZN0ybPHdLX5pwIBPHkuThFmJ5rBwZpw6mwcL9eVqTQ2XQBoEUul
x-ms-exchange-transport-forked: True
Content-ID: <C804E3D938FE464394A983E107431971@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e066dfa5-6301-40cc-4b1a-08d7f90fc595
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2020 20:37:23.0546 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BL/8TYJwhT81rw2qWJOI83hOXwcU+AGIU6VX+9oL28vlClxYSZPLzfOSAo7Dh3+1l1zGMkdbl+LXB3SZ1ggukg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1801MB1996
X-OriginatorOrg: suse.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04FKbsC6007749
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 4/6] Unit tests for is_path_valid()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-05-14 at 20:59 -0500, Benjamin Marzinski wrote:
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>

Two minor nits below, otherwise ack.

> ---
>  tests/Makefile |   4 +-
>  tests/valid.c  | 424
> +++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 427 insertions(+), 1 deletion(-)
>  create mode 100644 tests/valid.c
>=20
> diff --git a/tests/Makefile b/tests/Makefile
> index 1b8706a7..125553b8 100644
> --- a/tests/Makefile
> +++ b/tests/Makefile
> @@ -13,7 +13,7 @@ CFLAGS +=3D $(BIN_CFLAGS) -I$(multipathdir)
> -I$(mpathcmddir) \
>  LIBDEPS +=3D -L$(multipathdir) -L$(mpathcmddir) -lmultipath -lmpathcmd
> -lcmocka
> =20
>  TESTS :=3D uevent parser util dmevents hwtable blacklist unaligned vpd
> pgpolicy \
> -=09 alias directio
> +=09 alias directio valid
> =20
>  .SILENT: $(TESTS:%=3D%.o)
>  .PRECIOUS: $(TESTS:%=3D%-test)
> @@ -50,6 +50,8 @@ vpd-test_OBJDEPS :=3D  ../libmultipath/discovery.o
>  vpd-test_LIBDEPS :=3D -ludev -lpthread -ldl
>  alias-test_TESTDEPS :=3D test-log.o
>  alias-test_LIBDEPS :=3D -lpthread -ldl
> +valid-test_OBJDEPS :=3D ../libmultipath/valid.o
> +valid-test_LIBDEPS :=3D -ludev -lpthread -ldl
>  ifneq ($(DIO_TEST_DEV),)
>  directio-test_LIBDEPS :=3D -laio
>  endif
> diff --git a/tests/valid.c b/tests/valid.c
> new file mode 100644
> index 00000000..b128b029
> --- /dev/null
> +++ b/tests/valid.c
> @@ -0,0 +1,424 @@
> +/*
> + * Copyright (c) 2020 Benjamin Marzinski, Redhat
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version 2
> + * of the License, or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <
> https://www.gnu.org/licenses/>;.
> + *
> + */
> +
> +#define _GNU_SOURCE
> +#include <stdint.h>
> +#include <stdbool.h>
> +#include <stdarg.h>
> +#include <stddef.h>
> +#include <setjmp.h>
> +#include <stdlib.h>
> +#include <errno.h>
> +#include <cmocka.h>
> +#include "globals.c"
> +#include "util.h"
> +#include "discovery.h"
> +#include "wwids.h"
> +#include "valid.h"
> +
> +int test_fd;
> +struct udev_device {
> +=09int unused;
> +} test_udev;
> +
> +bool __wrap_sysfs_is_multipathed(struct path *pp, bool set_wwid)
> +{
> +=09bool is_multipathed =3D mock_type(bool);
> +=09assert_non_null(pp);
> +=09assert_int_not_equal(strlen(pp->dev), 0);
> +=09if (is_multipathed && set_wwid)
> +=09=09strlcpy(pp->wwid, mock_ptr_type(char *), WWID_SIZE);
> +=09return is_multipathed;
> +}
> +
> +int __wrap___mpath_connect(int nonblocking)
> +{
> +=09bool connected =3D mock_type(bool);
> +=09assert_int_equal(nonblocking, 1);
> +=09if (connected)
> +=09=09return test_fd;
> +=09errno =3D mock_type(int);
> +=09return -1;
> +}
> +
> +int __wrap_systemd_service_enabled(const char *dev)
> +{
> +=09return (int)mock_type(bool);
> +}
> +
> +/* There's no point in checking the return value here */
> +int __wrap_mpath_disconnect(int fd)
> +{
> +=09assert_int_equal(fd, test_fd);
> +=09return 0;
> +}
> +
> +struct udev_device
> *__wrap_udev_device_new_from_subsystem_sysname(struct udev *udev,
> const char *subsystem, const char *sysname)
> +{
> +=09bool passed =3D mock_type(bool);
> +=09assert_string_equal(sysname, mock_ptr_type(char *));
> +=09if (passed)
> +=09=09return &test_udev;
> +=09return NULL;
> +}
> +
> +int __wrap_pathinfo(struct path *pp, struct config *conf, int mask)
> +{
> +=09int ret =3D mock_type(int);
> +=09assert_string_equal(pp->dev, mock_ptr_type(char *));
> +=09assert_int_equal(mask, DI_SYSFS | DI_WWID | DI_BLACKLIST);
> +=09if (ret =3D=3D PATHINFO_OK)
> +=09=09strlcpy(pp->wwid, mock_ptr_type(char *), WWID_SIZE);
> +=09else
> +=09=09memset(pp->wwid, 0, WWID_SIZE);
> +=09return ret;
> +}
> +
> +int __wrap_is_failed_wwid(const char *wwid)
> +{
> +=09int ret =3D mock_type(int);
> +=09assert_string_equal(wwid, mock_ptr_type(char *));
> +=09return ret;
> +}
> +
> +int __wrap_check_wwids_file(char *wwid, int write_wwid)
> +{
> +=09bool passed =3D mock_type(bool);
> +=09assert_int_equal(write_wwid, 0);
> +=09assert_string_equal(wwid, mock_ptr_type(char *));
> +=09if (passed)
> +=09=09return 0;
> +=09else
> +=09=09return -1;
> +}
> +
> +int __wrap_dm_map_present_by_uuid(const char *uuid)
> +{
> +=09int ret =3D mock_type(int);
> +=09assert_string_equal(uuid, mock_ptr_type(char *));
> +=09return ret;
> +}
> +
> +enum {
> +=09STAGE_IS_MULTIPATHED,
> +=09STAGE_CHECK_MULTIPATHD,
> +=09STAGE_GET_UDEV_DEVICE,
> +=09STAGE_PATHINFO,
> +=09STAGE_IS_FAILED,
> +=09STAGE_CHECK_WWIDS,
> +=09STAGE_UUID_PRESENT,
> +};

nice :-)

> +
> +/* setup the test to continue past the given stage in
> is_path_valid() */
> +static void setup_passing(char *name, char *wwid, bool
> check_multipathd,
> +=09=09=09  unsigned int stage)
> +{
> +=09will_return(__wrap_sysfs_is_multipathed, false);
> +=09if (stage =3D=3D STAGE_IS_MULTIPATHED)
> +=09=09return;
> +=09if (check_multipathd)
> +=09=09will_return(__wrap___mpath_connect, true);
> +=09if (stage =3D=3D STAGE_CHECK_MULTIPATHD)
> +=09=09return;
> +=09will_return(__wrap_udev_device_new_from_subsystem_sysname,
> true);
> +=09will_return(__wrap_udev_device_new_from_subsystem_sysname,
> +=09=09    name);
> +=09if (stage =3D=3D STAGE_GET_UDEV_DEVICE)
> +=09=09return;
> +=09will_return(__wrap_pathinfo, PATHINFO_OK);
> +=09will_return(__wrap_pathinfo, name);
> +=09will_return(__wrap_pathinfo, wwid);
> +=09if (stage =3D=3D STAGE_PATHINFO)
> +=09=09return;
> +=09will_return(__wrap_is_failed_wwid, WWID_IS_NOT_FAILED);
> +=09will_return(__wrap_is_failed_wwid, wwid);
> +=09if (stage =3D=3D STAGE_IS_FAILED)
> +=09=09return;
> +=09will_return(__wrap_check_wwids_file, false);
> +=09will_return(__wrap_check_wwids_file, wwid);
> +=09if (stage =3D=3D STAGE_CHECK_WWIDS)
> +=09=09return;
> +=09will_return(__wrap_dm_map_present_by_uuid, 0);
> +=09will_return(__wrap_dm_map_present_by_uuid, wwid);
> +}
> +
> +static void test_bad_arguments(void **state)
> +{
> +=09struct path pp;
> +=09char too_long[FILE_NAME_SIZE + 1];
> +
> +=09memset(&pp, 0, sizeof(pp));
> +=09/* test NULL pointers */
> +=09assert_int_equal(is_path_valid("test", &conf, NULL, true),
> +=09=09=09 PATH_IS_ERROR);
> +=09assert_int_equal(is_path_valid("test", NULL, &pp, true),
> +=09=09=09 PATH_IS_ERROR);
> +=09assert_int_equal(is_path_valid(NULL, &conf, &pp, true),
> +=09=09=09 PATH_IS_ERROR);
> +=09/* test undefined find_mutlipaths */

typo

> +=09conf.find_multipaths =3D FIND_MULTIPATHS_UNDEF;
> +=09assert_int_equal(is_path_valid("test", &conf, &pp, true),
> +=09=09=09 PATH_IS_ERROR);
> +=09/* test name too long */
> +=09memset(too_long, 'x', sizeof(too_long));
> +=09too_long[sizeof(too_long) - 1] =3D '\0';
> +=09conf.find_multipaths =3D FIND_MULTIPATHS_STRICT;
> +=09assert_int_equal(is_path_valid(too_long, &conf, &pp, true),
> +=09=09=09 PATH_IS_ERROR);
> +}
> +
> +static void test_sysfs_is_multipathed(void **state)
> +{
> +=09struct path pp;
> +=09char *name =3D "test";
> +=09char *wwid =3D "test_wwid";
> +
> +=09memset(&pp, 0, sizeof(pp));
> +=09conf.find_multipaths =3D FIND_MULTIPATHS_STRICT;
> +=09/* test for already existing multiapthed device */
> +=09will_return(__wrap_sysfs_is_multipathed, true);
> +=09will_return(__wrap_sysfs_is_multipathed, wwid);
> +=09assert_int_equal(is_path_valid(name, &conf, &pp, true),
> +=09=09=09 PATH_IS_VALID_NO_CHECK);
> +=09assert_string_equal(pp.dev, name);
> +=09assert_string_equal(pp.wwid, wwid);
> +=09/* test for wwid device with empty wwid */
> +=09will_return(__wrap_sysfs_is_multipathed, true);
> +=09will_return(__wrap_sysfs_is_multipathed, "");
> +=09assert_int_equal(is_path_valid(name, &conf, &pp, true),
> +=09=09=09 PATH_IS_ERROR);
> +}
> +
> +static void test_check_multipathd(void **state)
> +{
> +=09struct path pp;
> +=09char *name =3D "test";
> +
> +=09memset(&pp, 0, sizeof(pp));
> +=09conf.find_multipaths =3D FIND_MULTIPATHS_STRICT;
> +=09/* test failed check to see if multipathd is active */
> +=09will_return(__wrap_sysfs_is_multipathed, false);
> +=09will_return(__wrap___mpath_connect, false);
> +=09will_return(__wrap___mpath_connect, ECONNREFUSED);
> +=09will_return(__wrap_systemd_service_enabled, false);
> +=09assert_int_equal(is_path_valid(name, &conf, &pp, true),
> +=09=09=09 PATH_IS_NOT_VALID);
> +=09assert_string_equal(pp.dev, name);
> +=09/* test pass because service is enabled. fail getting udev */
> +=09memset(&pp, 0, sizeof(pp));
> +=09will_return(__wrap_sysfs_is_multipathed, false);
> +=09will_return(__wrap___mpath_connect, false);
> +=09will_return(__wrap___mpath_connect, ECONNREFUSED);
> +=09will_return(__wrap_systemd_service_enabled, true);
> +=09will_return(__wrap_udev_device_new_from_subsystem_sysname,
> false);
> +=09will_return(__wrap_udev_device_new_from_subsystem_sysname,
> +=09=09    name);
> +=09assert_int_equal(is_path_valid(name, &conf, &pp, true),
> +=09=09=09 PATH_IS_ERROR);
> +=09assert_string_equal(pp.dev, name);
> +=09/* test pass because connect returned EAGAIN. fail getting udev
> */
> +=09will_return(__wrap_sysfs_is_multipathed, false);
> +=09will_return(__wrap___mpath_connect, false);
> +=09will_return(__wrap___mpath_connect, EAGAIN);

Here we may want a test that should succeeds with PATH_IS_VALID after
mpath_connect returns EAGAIN.

> +=09will_return(__wrap_udev_device_new_from_subsystem_sysname,
> false);
> +=09will_return(__wrap_udev_device_new_from_subsystem_sysname,
> +=09=09    name);
> +=09assert_int_equal(is_path_valid(name, &conf, &pp, true),
> +=09=09=09 PATH_IS_ERROR);
> +=09/* test pass because connect succeeded. fail getting udev */
> +=09memset(&pp, 0, sizeof(pp));
> +=09will_return(__wrap_sysfs_is_multipathed, false);
> +=09will_return(__wrap___mpath_connect, true);
> +=09will_return(__wrap_udev_device_new_from_subsystem_sysname,
> false);
> +=09will_return(__wrap_udev_device_new_from_subsystem_sysname,
> +=09=09    name);
> +=09assert_int_equal(is_path_valid(name, &conf, &pp, true),
> +=09=09=09 PATH_IS_ERROR);
> +=09assert_string_equal(pp.dev, name);
> +}
> +
> +static void test_pathinfo(void **state)
> +{
> +=09struct path pp;
> +=09char *name =3D "test";
> +
> +=09memset(&pp, 0, sizeof(pp));
> +=09conf.find_multipaths =3D FIND_MULTIPATHS_STRICT;
> +=09/* Test pathinfo blacklisting device */
> +=09setup_passing(name, NULL, false, STAGE_GET_UDEV_DEVICE);
> +=09will_return(__wrap_pathinfo, PATHINFO_SKIPPED);
> +=09will_return(__wrap_pathinfo, name);
> +=09assert_int_equal(is_path_valid(name, &conf, &pp, false),
> +=09=09=09 PATH_IS_NOT_VALID);
> +=09assert_string_equal(pp.dev, name);
> +=09assert_ptr_equal(pp.udev, &test_udev);
> +=09/* Test pathinfo failing */
> +=09memset(&pp, 0, sizeof(pp));
> +=09setup_passing(name, NULL, false, STAGE_GET_UDEV_DEVICE);
> +=09will_return(__wrap_pathinfo, PATHINFO_FAILED);
> +=09will_return(__wrap_pathinfo, name);
> +=09assert_int_equal(is_path_valid(name, &conf, &pp, false),
> +=09=09=09 PATH_IS_ERROR);
> +=09/* Test blank wwid */
> +=09memset(&pp, 0, sizeof(pp));
> +=09setup_passing(name, NULL, false, STAGE_GET_UDEV_DEVICE);
> +=09will_return(__wrap_pathinfo, PATHINFO_OK);
> +=09will_return(__wrap_pathinfo, name);
> +=09will_return(__wrap_pathinfo, "");
> +=09assert_int_equal(is_path_valid(name, &conf, &pp, false),
> +=09=09=09 PATH_IS_NOT_VALID);
> +}
> +
> +static void test_is_failed_wwid(void **state)
> +{
> +=09struct path pp;
> +=09char *name =3D "test";
> +=09char *wwid =3D "test-wwid";
> +
> +=09memset(&pp, 0, sizeof(pp));
> +=09conf.find_multipaths =3D FIND_MULTIPATHS_STRICT;
> +=09/* Test wwid failed */
> +=09setup_passing(name, wwid, false, STAGE_PATHINFO);
> +=09will_return(__wrap_is_failed_wwid, WWID_IS_FAILED);
> +=09will_return(__wrap_is_failed_wwid, wwid);
> +=09assert_int_equal(is_path_valid(name, &conf, &pp, false),
> +=09=09=09 PATH_IS_NOT_VALID);
> +=09assert_string_equal(pp.dev, name);
> +=09assert_ptr_equal(pp.udev, &test_udev);
> +=09assert_string_equal(pp.wwid, wwid);
> +=09/* test is_failed_wwid error */
> +=09setup_passing(name, wwid, false, STAGE_PATHINFO);
> +=09will_return(__wrap_is_failed_wwid, WWID_FAILED_ERROR);
> +=09will_return(__wrap_is_failed_wwid, wwid);
> +=09assert_int_equal(is_path_valid(name, &conf, &pp, false),
> +=09=09=09 PATH_IS_ERROR);
> +}
> +
> +static void test_greedy(void **state)
> +{
> +=09struct path pp;
> +=09char *name =3D "test";
> +=09char *wwid =3D "test-wwid";
> +
> +=09memset(&pp, 0, sizeof(pp));
> +=09conf.find_multipaths =3D FIND_MULTIPATHS_GREEDY;
> +=09setup_passing(name, wwid, false, STAGE_IS_FAILED);
> +=09assert_int_equal(is_path_valid(name, &conf, &pp, false),
> +=09=09=09 PATH_IS_VALID);
> +=09assert_string_equal(pp.dev, name);
> +=09assert_ptr_equal(pp.udev, &test_udev);
> +=09assert_string_equal(pp.wwid, wwid);
> +}
> +
> +static void test_check_wwids(void **state)
> +{
> +=09struct path pp;
> +=09char *name =3D "test";
> +=09char *wwid =3D "test-wwid";
> +
> +=09memset(&pp, 0, sizeof(pp));
> +=09conf.find_multipaths =3D FIND_MULTIPATHS_STRICT;
> +=09setup_passing(name, wwid, false, STAGE_IS_FAILED);
> +=09will_return(__wrap_check_wwids_file, true);
> +=09will_return(__wrap_check_wwids_file, wwid);
> +=09assert_int_equal(is_path_valid(name, &conf, &pp, false),
> +=09=09=09 PATH_IS_VALID_NO_CHECK);
> +=09assert_string_equal(pp.dev, name);
> +=09assert_ptr_equal(pp.udev, &test_udev);
> +=09assert_string_equal(pp.wwid, wwid);
> +}
> +
> +static void test_check_uuid_present(void **state)
> +{
> +=09struct path pp;
> +=09char *name =3D "test";
> +=09char *wwid =3D "test-wwid";
> +
> +=09memset(&pp, 0, sizeof(pp));
> +=09conf.find_multipaths =3D FIND_MULTIPATHS_STRICT;
> +=09setup_passing(name, wwid, false, STAGE_CHECK_WWIDS);
> +=09will_return(__wrap_dm_map_present_by_uuid, 1);
> +=09will_return(__wrap_dm_map_present_by_uuid, wwid);
> +=09assert_int_equal(is_path_valid(name, &conf, &pp, false),
> +=09=09=09 PATH_IS_VALID);
> +=09assert_string_equal(pp.dev, name);
> +=09assert_ptr_equal(pp.udev, &test_udev);
> +=09assert_string_equal(pp.wwid, wwid);
> +}
> +
> +
> +static void test_find_multipaths(void **state)
> +{
> +=09struct path pp;
> +=09char *name =3D "test";
> +=09char *wwid =3D "test-wwid";
> +
> +=09/* test find_multipaths =3D FIND_MULTIPATHS_STRICT */
> +=09memset(&pp, 0, sizeof(pp));
> +=09conf.find_multipaths =3D FIND_MULTIPATHS_STRICT;
> +=09setup_passing(name, wwid, false, STAGE_UUID_PRESENT);
> +=09assert_int_equal(is_path_valid(name, &conf, &pp, false),
> +=09=09=09 PATH_IS_NOT_VALID);
> +=09assert_string_equal(pp.dev, name);
> +=09assert_ptr_equal(pp.udev, &test_udev);
> +=09assert_string_equal(pp.wwid, wwid);
> +=09/* test find_multipaths =3D FIND_MULTIPATHS_OFF */
> +=09memset(&pp, 0, sizeof(pp));
> +=09conf.find_multipaths =3D FIND_MULTIPATHS_OFF;
> +=09setup_passing(name, wwid, false, STAGE_UUID_PRESENT);
> +=09assert_int_equal(is_path_valid(name, &conf, &pp, false),
> +=09=09=09 PATH_IS_NOT_VALID);
> +=09/* test find_multipaths =3D FIND_MULTIPATHS_ON */
> +=09memset(&pp, 0, sizeof(pp));
> +=09conf.find_multipaths =3D FIND_MULTIPATHS_ON;
> +=09setup_passing(name, wwid, false, STAGE_UUID_PRESENT);
> +=09assert_int_equal(is_path_valid(name, &conf, &pp, false),
> +=09=09=09 PATH_IS_NOT_VALID);
> +=09/* test find_multipaths =3D FIND_MULTIPATHS_SMART */
> +=09memset(&pp, 0, sizeof(pp));
> +=09conf.find_multipaths =3D FIND_MULTIPATHS_SMART;
> +=09setup_passing(name, wwid, false, STAGE_UUID_PRESENT);
> +=09assert_int_equal(is_path_valid(name, &conf, &pp, false),
> +=09=09=09 PATH_IS_MAYBE_VALID);
> +=09assert_string_equal(pp.dev, name);
> +=09assert_ptr_equal(pp.udev, &test_udev);
> +=09assert_string_equal(pp.wwid, wwid);
> +}
> +
> +int test_valid(void)
> +{
> +=09const struct CMUnitTest tests[] =3D {
> +=09=09cmocka_unit_test(test_bad_arguments),
> +=09=09cmocka_unit_test(test_sysfs_is_multipathed),
> +=09=09cmocka_unit_test(test_check_multipathd),
> +=09=09cmocka_unit_test(test_pathinfo),
> +=09=09cmocka_unit_test(test_is_failed_wwid),
> +=09=09cmocka_unit_test(test_greedy),
> +=09=09cmocka_unit_test(test_check_wwids),
> +=09=09cmocka_unit_test(test_check_uuid_present),
> +=09=09cmocka_unit_test(test_find_multipaths),
> +=09};
> +=09return cmocka_run_group_tests(tests, NULL, NULL);
> +}
> +
> +int main(void)
> +{
> +=09int ret =3D 0;
> +=09ret +=3D test_valid();
> +=09return ret;
> +}

--=20
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE  Software Solutions Germany GmbH
HRB 36809, AG N=FCrnberg GF: Felix
Imend=F6rffer



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

